local M = {}

M.required_language_servers = {
	"pyright",
	"ts_ls",
	"html",
	"cssls",
	"vuels",
	"lua_ls",
	"marksman",
	"gopls",
	"clangd",
}
M.required_linters_formatters = {
	"flake8", -- Python Linter
	"isort", -- Python Formatter
	"black", -- Python Formatter
	"autoflake", -- Python Removes unused vars/imports
	"prettier", -- JS Formatter
	"stylua", -- Lua Formatter
	"golangci-lint", -- Go Linter
	"cpplint", -- C/C++ Linter
	"clang-format", -- C/C++ Formatter
}
M.required_grammars = {
	"python",
	"javascript",
	"typescript",
	"html",
	"css",
	"lua",
	"cpp",
	"sql",
	"java",
	"kotlin",
	"go",
}

return M
