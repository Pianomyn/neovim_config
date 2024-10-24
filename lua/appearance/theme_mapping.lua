local M = {}

M.color_scheme_to_lualine_theme = {
	vscode = "vscode",
	-- codedark = "codedark",  -- vimscript
	["gruvbox-material"] = "gruvbox-material",
	gruvbox = "gruvbox_dark",
	nordic = "nord",
	nord = "nord",
	onenord = "nord",
}

M.current_color_scheme = M.color_scheme_to_lualine_theme.vscode

return M
