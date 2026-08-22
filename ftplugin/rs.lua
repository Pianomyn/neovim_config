vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*.rs" },
	callback = function()
		vim.treesitter.start()
	end,
})
