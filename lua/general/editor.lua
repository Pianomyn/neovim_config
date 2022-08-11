vim.lsp.set_log_level("debug")
vim.opt.completeopt = {"menu", "menuone"} 
vim.opt.termguicolors = true
vim.opt.background = "dark" 
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wildignore = {"__pycache__", "volumes"} 
vim.opt.cursorline = true

vim.wo.colorcolumn = "120"

vim.cmd("silent! colorscheme codedark")
vim.cmd("set encoding=utf-8")
vim.cmd("set hlsearch")

vim.cmd("set expandtab")
vim.cmd("set autoindent")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set smarttab")
vim.opt.shortmess:append "c"
vim.opt.pumheight = 10
vim.opt.cmdheight= 2
