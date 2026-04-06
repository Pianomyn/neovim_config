vim.api.nvim_create_autocmd("Python", {
	pattern = { "*.py" },
	callback = function()
		vim.treesitter.start()
	end,
})
