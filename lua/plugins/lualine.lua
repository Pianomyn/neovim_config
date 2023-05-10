local base16 = require("lualine.themes.base16") -- command and normal same color
local codedark = require("lualine.themes.codedark") -- command and normal same color
local onedark = require("lualine.themes.onedark")
local nord = require("lualine.themes.nord")

require("lualine").setup({
	options = {
		theme = onedark,
	},
})
