vim.api.nvim_create_autocmd("rust", {
	pattern = { "*.rs" },
	callback = function()
		vim.treesitter.start()
	end,
})
