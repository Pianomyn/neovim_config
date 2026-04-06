vim.api.nvim_create_autocmd("C++", {
	pattern = { "*.cpp" },
	callback = function()
		vim.treesitter.start()
	end,
})
