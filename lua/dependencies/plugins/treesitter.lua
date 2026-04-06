local CONSTANTS = require("constants")

require("nvim-treesitter.configs").setup({
	ensure_installed = CONSTANTS.REQUIRED_GRAMMARS,
	sync_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*.go", "*.py", "*.java", "*.ts", "*.tsx", "*.js", "*.jsx", "*.cpp", "*.rs" },
	callback = function()
		vim.treesitter.start()
	end,
})
