local theme_mapping = require("appearance.theme_mapping")

vim.opt.termguicolors = true
vim.opt.background = "dark"
-- vim.cmd("hi TabLineSel guibg=#223e55 guifg=#9CDCFE")
-- vim.cmd("hi TabLineSel guifg=LightGreen guibg=DarkGreen ctermfg=LightGreen ctermbg=DarkGreen ")

vim.cmd.colorscheme(theme_mapping.current_color_scheme)

local M = {}
M.lualine_theme = theme_mapping[theme_mapping.current_color_scheme]
return M
