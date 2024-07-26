required_linters_formatters = {
	"cpplint", -- C/C++ Linter
	"clang-format", -- C/C++ Formatter
	"flake8", -- Python Linter
	"isort", -- Python Formatter
	"black", -- Python Formatter
	"autoflake", -- Python Formatter: Removes unused imports and variables
	"prettier", -- JS Formatter
	"stylua", -- Lua Formatter
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = REQUIRED_LANGUAGE_SERVERS,
	automatic_installation = true,
})
require("mason-null-ls").setup({
	ensure_installed = required_linters_formatters,
	automatic_installation = true,
})
