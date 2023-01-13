require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = REQUIRED_LANGUAGE_SERVERS,
  automatic_installation = true,
})
require("mason-null-ls").setup({
  ensure_installed = REQUIRED_LINTERS_FORMATTERS,
  automatic_installation = true,
})
