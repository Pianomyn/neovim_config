vim.opt.completeopt = {"menu", "menuone", "noinsert"} 
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
local lspconfig = require("lspconfig")


lspconfig["pyright"].setup{
    on_attach= on_attach,
    capabilities = capabilities
}
lspconfig["eslint"].setup{
    capabilities = capabilities
}
lspconfig["tsserver"].setup{
    capabilities = capabilities
}
lspconfig["html"].setup{
    capabilities = capabilities
}

local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

local luasnip_status, luasnip= pcall(require, "luasnip")
if not luasnip_status then
	return
end


local check_backspace = function()
	local col = vim.fn.col "." - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

require("luasnip/loaders/from_vscode").lazy_load()

local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(select_opts), 
        ["<C-j>"] = cmp.mapping.select_next_item(select_opts),
        ["<Up>"] = cmp.mapping.select_prev_item(select_opts), 
        ["<Down>"] = cmp.mapping.select_next_item(select_opts),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), {"i", "c"}),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), {"i", "c"}),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        ["<C-d>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.jumpable(1) then
                luasnip.jump(1)
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,{"i", "s"}),
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                nvim_lua = "[LUA]",
                luasnip = "[SNIP]",
            })[entry.source.name]
            return vim_item
        end
    },
    sources = {
        {name = "nvim_lsp"},
        {name = "luasnip"},
        {name = "nvim_lua"},
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    }
})









-- LSP Installer
local status_installer, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_installer then
    return
end

lsp_installer.setup {
    ensure_installed = {"pyright", "tsserver", "eslint"},
}
    
local opts = { noremap=true, silent=true }





-- LSP Diagnostic Toggler
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
require("toggle_lsp_diagnostics").init({ start_on = true, underline = false })
