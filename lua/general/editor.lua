local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end

	notify(msg, ...)
end

vim.lsp.set_log_level("debug")
vim.opt.completeopt = { "menu", "menuone" }
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.number = true
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wildignore = { "__pycache__", "volumes" }
vim.opt.cursorline = true
vim.opt.clipboard="unnamedplus" -- Vim will use the same register as the OS for copy/paste
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


--vim.cmd.colorscheme "vscode" -- lua
--vim.cmd.colorscheme "nordic"
--vim.cmd.colorscheme "gruvbox-material"

vim.cmd.colorscheme "nord"
--vim.cmd.colorscheme "onenord"
--vim.cmd.colorscheme "codedark" -- vimscript
--vim.cmd.colorscheme "gruvbox"
--vim.cmd.colorscheme "everforest"

vim.cmd("hi TabLineSel guibg=#223e55 guifg=#9CDCFE")
-- vim.cmd("hi TabLineSel guifg=LightGreen guibg=DarkGreen ctermfg=LightGreen ctermbg=DarkGreen ")

