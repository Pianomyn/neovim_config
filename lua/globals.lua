REQUIRED_LANGUAGE_SERVERS = {
	"clangd",
	"pyright",
	"tsserver",
	"html",
	"cssls",
	"lua_ls",
	"marksman",
  "kotlin_language_server",
}

REQUIRED_LINTERS_FORMATTERS = {
	"cpplint", -- C/C++ Linter
	"clang-format", -- C/C++ Formatter
	"flake8", -- Python Linter
	"isort", -- Python Formatter
	"black", -- Python Formatter
	"autoflake", -- Python Formatter: Removes unused imports and variables
	"prettier", -- JS Formatter
	"stylua", -- Lua Formatter
  "ktlint", -- Kotlin
}

REQUIRED_GRAMMARS = {
	"cpp",
	"python",
	"javascript",
	"typescript",
	"html",
	"css",
	"lua",
	"sql",
  "kotlin",
}
