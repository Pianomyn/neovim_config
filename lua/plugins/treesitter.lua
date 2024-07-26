local required_grammars = {
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

require("nvim-treesitter.configs").setup({
	ensure_installed = required_grammars,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	rainbow = {
		--enable = true,
		--extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
})
