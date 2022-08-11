


vim.opt.completeopt = "menu,menuone,noselect"
local cmp = require("cmp")
local luasnip = require("luasnip")


cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
       completion = cmp.config.window.bordered(),
       documentation = cmp.config.window.bordered(),
    },
    mapping = {
    ["<C-k"] = cmp.mapping.select_prev_item(),
    ["<C-j"] = cmp.mapping.select_next_item(),
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),
['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
	      elseif luasnip.expandable() then
                luasnip.expand()
            elseif cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.jumpable(1) then
                luasnip.jump(1)
            else
	    	fallback()
            end
          end, {"i", "s"}),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
	     elseif luasnip.jumpable(-1) then
	    	luasnip.jump(-1)
            else
              fallback()
            end
          end,{"i", "s"}),
	  ["<C-y>"] = cmp.mapping(cmp.mapping.complete({
        reason = cmp.ContextReason.Auto,
      }), {"i", "c"}),
        ["<CR>"] = cmp.mapping.confirm ({ select = true }),
    },
    sources = {
        { name = 'nvim_lsp' },
        {name = "nvim_lua"},
    },
  })






require("nvim-lsp-installer").setup {
    ensure_installed = {"pyright", "tsserver", "eslint"},
    automatic_installation = true
    }

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local lspconfig = require("lspconfig")

lspconfig['pyright'].setup{
   -- on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}
lspconfig['eslint'].setup{
    --on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}
lspconfig['tsserver'].setup{
    --on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}
lspconfig['html'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}

require'toggle_lsp_diagnostics'.init({ start_on = true, underline = false })
