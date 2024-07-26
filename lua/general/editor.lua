local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end

	notify(msg, ...)
end

vim.lsp.set_log_level("debug")
vim.opt.completeopt = { "menu", "menuone" }
vim.opt.number = true
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wildignore = { "__pycache__", "volumes" }
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus" -- Vim will use the same register as the OS for copy/paste
vim.wo.colorcolumn = "80,120"
vim.opt.encoding = "utf-8"
vim.opt.hlsearch = true

vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 2 -- Number of spaces inserted when indenting
vim.opt.tabstop = 2 -- Number of spaces a tab character looks like
vim.opt.softtabstop = 2 -- Number of spaces inserted instead of a tab character
vim.opt.splitbelow = true
