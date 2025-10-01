local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end

	notify(msg, ...)
end

--vim.lsp.set_log_level("debug")
vim.opt.number = true
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wildignore = { "__pycache__", "volumes" }
vim.opt.cursorline = true
--vim.opt.clipboard = "unnamedplus" -- Vim will use the same register as the OS for copy/paste
vim.wo.colorcolumn = "80,120"
vim.opt.encoding = "utf-8"
vim.opt.hlsearch = true

vim.opt.expandtab = true  -- Replace leading tabs with spaces when pressing "Tab"
vim.opt.smarttab = true  -- Inserts tabs/spaces based on previous line
vim.opt.tabstop = 2 -- Number of spaces a tab character looks like
vim.opt.softtabstop = 2 -- Number of spaces inserted when pressing Tab
vim.opt.autoindent = true  -- Copies indentation from previous line
vim.opt.shiftwidth = 2 -- Number of spaces inserted when indenting with S-< or S->

vim.opt.splitbelow = true

vim.diagnostic.config ({
  virtual_text = true,
  virtual_lines = false,
})
