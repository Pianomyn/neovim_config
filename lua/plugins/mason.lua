local server_list = {"pyright", "tsserver", "html"}
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = server_list,
  automatic_installation = true,
})
