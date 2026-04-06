vim.api.nvim_create_autocmd("JS and TS", {
	pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
	callback = function()
		vim.treesitter.start()
	end,
})
