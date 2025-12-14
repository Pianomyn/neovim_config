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
M.REQUIRED_LINTERS = {
  ruff = "python",  -- Python Linter / Formatter
	["golangcilint"] = "go", -- Go Linter
	cpplint = "cpp", -- C/C++ Linter
}
M.REQUIRED_FORMATTERS = {
  ruff = "python",  -- Python Linter / Formatter
	prettier = "javascript", -- JS Formatter
	stylua = "lua", -- Lua Formatter
	["clang-format"] = "cpp", -- C/C++ Formatter
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
