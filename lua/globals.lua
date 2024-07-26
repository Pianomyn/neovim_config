REQUIRED_LANGUAGE_SERVERS = {
	"clangd",
	"pyright",
	"jdtls",
	"tsserver",
	"html",
	"cssls",
	"vuels",
	"lua_ls",
	"marksman",
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
	"java",
	"kotlin",
}

COLOR_SCHEME_TO_LUALINE_THEME = {
	vscode = "codedark",
	codedark = "codedark",
	["gruvbox-material"] = "gruvbox-material",
	gruvbox = "gruvbox_dark",
	nordic = "nord",
	nord = "nord",
	onenord = "nord",
	everforest = "onedark",
}

CURRENT_COLOR_SCHEME = "gruvbox-material"
