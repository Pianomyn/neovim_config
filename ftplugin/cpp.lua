vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*.cpp" },
	callback = function()
		vim.treesitter.start()
	end,
})
