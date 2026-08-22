vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
	callback = function()
		vim.treesitter.start()
	end,
})
