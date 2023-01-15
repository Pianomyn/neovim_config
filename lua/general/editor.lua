vim.lsp.set_log_level("off")
vim.opt.completeopt = { "menu", "menuone" }
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wildignore = { "__pycache__", "volumes" }
vim.opt.cursorline = true

vim.wo.colorcolumn = "80,120"

--vim.cmd("silent! colorscheme onenord")
vim.cmd("silent! colorscheme nord")
--vim.cmd("silent! colorscheme codedark")
vim.cmd("set encoding=utf-8")
vim.cmd("set hlsearch")

vim.cmd("set expandtab")
vim.cmd("set autoindent")
vim.cmd("set smarttab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set splitbelow")

-- Colors / Themes
vim.cmd("set termguicolors")
-- vim.cmd("hi TabLineSel ctermbg=100 guibg=1")
-- vim.opt.pumheight = 10
-- vim.opt.cmdheight= 2
