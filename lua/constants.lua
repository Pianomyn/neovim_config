local M = {}

M.REQUIRED_LANGUAGE_SERVERS = {
	"pyright",
	"ts_ls",
	"html",
	"cssls",
	"lua_ls",
	"marksman",
	"gopls",
	"clangd",
}
M.REQUIRED_LINTERS_FORMATTERS = {
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
M.REQUIRED_GRAMMARS = {
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
