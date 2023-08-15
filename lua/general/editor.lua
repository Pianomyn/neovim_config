local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end

	notify(msg, ...)
end

vim.lsp.set_log_level("off")
vim.opt.completeopt = { "menu", "menuone" }
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wildignore = { "__pycache__", "volumes" }
vim.opt.cursorline = true

vim.wo.colorcolumn = "80,120"

-- vim.cmd("silent! colorscheme nord")
-- vim.cmd("silent! colorscheme onenord")
-- vim.cmd("silent! colorscheme vscode") -- lua
vim.cmd("silent! colorscheme codedark") -- vimscript
vim.cmd("hi TabLineSel guibg=#223e55 guifg=#9CDCFE")
-- vim.cmd("hi TabLineSel guifg=LightGreen guibg=DarkGreen ctermfg=LightGreen ctermbg=DarkGreen ")

vim.opt.encoding = "utf-8"
vim.opt.hlsearch = true
-- vim.cmd("set guitablabel=[%N] %t %M")
vim.cmd("set guitablabel=%t\\ %m")
-- vim.opt.mouse = ""

vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 2 -- Number of spaces inserted when indenting
vim.opt.tabstop = 2 -- Number of spaces a tab character looks like
vim.opt.softtabstop = 2 -- Number of spaces inserted instead of a tab character
vim.opt.splitbelow = true
