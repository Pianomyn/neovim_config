local M = {}

M.required_language_servers = {
	"clangd",
	"pyright",
	"jdtls", -- Gives formatting diagnostics
	"tsserver",
	"html",
	"cssls",
	"vuels",
	"lua_ls",
	"marksman",
  "gopls",
}
M.required_linters_formatters = {
	"cpplint", -- C/C++ Linter
	"clang-format", -- C/C++ Formatter
	"flake8", -- Python Linter
	"isort", -- Python Formatter
	"black", -- Python Formatter
	"autoflake", -- Python Formatter: Removes unused imports and variables
	"prettier", -- JS Formatter
	"stylua", -- Lua Formatter
	"golangci-lint", -- Go Linter
}
M.required_grammars = {
	"cpp",
	"python",
	"javascript",
	"typescript",
	"html",
	"css",
	"lua",
	"sql",
	"java",
	"kotlin",
  "go",
}

return M
