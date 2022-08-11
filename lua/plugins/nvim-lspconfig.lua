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
--    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}
lspconfig['eslint'].setup{
 --   on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}
lspconfig['tsserver'].setup{
  --  on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}
lspconfig['html'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}

require'toggle_lsp_diagnostics'.init({ start_on = true, underline = false })
