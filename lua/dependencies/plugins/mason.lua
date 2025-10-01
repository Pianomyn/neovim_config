local CONSTANTS = require("constants")

require("mason").setup({
	ui = {
		keymaps = {
			---@since 1.0.0
			-- Keymap to expand a package
			toggle_package_expand = "<CR>",
			---@since 1.0.0
			-- Keymap to install the package under the current cursor position
			install_package = "i",
			---@since 1.0.0
			-- Keymap to reinstall/update the package under the current cursor position
			update_package = "u",
			---@since 1.0.0
			-- Keymap to check for new version for the package under the current cursor position
			check_package_version = "c",
			---@since 1.0.0
			-- Keymap to update all installed packages
			update_all_packages = "U",
			---@since 1.0.0
			-- Keymap to check which installed packages are outdated
			check_outdated_packages = "C",
			---@since 1.0.0
			-- Keymap to uninstall a package
			uninstall_package = "X",
			---@since 1.0.0
			-- Keymap to apply language filter
			apply_language_filter = "<C-f>",
			---@since 1.1.0
			-- Keymap to toggle viewing package installation log
			toggle_package_install_log = "<CR>",
			---@since 1.8.0
			-- Keymap to toggle the help view
			toggle_help = "g?",
		},
	},
})
require("mason-lspconfig").setup({
	ensure_installed = CONSTANTS.REQUIRED_LANGUAGE_SERVERS,
	automatic_installation = true,
})

local linters_and_formatters = {}

for linter, _ in pairs(CONSTANTS.REQUIRED_LINTERS) do
  table.insert(linters_and_formatters, linter)
end
for formatter, _ in pairs(CONSTANTS.REQUIRED_FORMATTERS) do
  table.insert(linters_and_formatters, formatter)
end

require("mason-null-ls").setup({
	ensure_installed = linters_and_formatters,
	automatic_installation = true,
})
