local theme_mapping = require("appearance.theme_mapping")

vim.opt.termguicolors = true
vim.opt.background = "light"
--vim.opt.background = "dark"

vim.cmd.colorscheme(theme_mapping.current_color_scheme)

-- vim.cmd("hi TabLineSel guibg=#223e55 guifg=#9CDCFE")  -- tab colors
-- vim.cmd("hi TabLineSel guifg=LightGreen guibg=DarkGreen ctermfg=LightGreen ctermbg=DarkGreen ")

local M = {}
M.lualine_theme = theme_mapping[theme_mapping.current_color_scheme]
return M
