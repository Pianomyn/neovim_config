local dependencies = require("utils.dependencies")

print(vim.inspect(dependencies))
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = dependencies.required_language_servers,
	automatic_installation = true,
})
require("mason-null-ls").setup({
	ensure_installed = dependencies.required_linters_formatters,
	automatic_installation = true,
})
