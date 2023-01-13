require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = required_language_servers,
  automatic_installation = true,
})
