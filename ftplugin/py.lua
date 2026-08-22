vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*.py" },
	callback = function()
		vim.treesitter.start()
	end,
})
