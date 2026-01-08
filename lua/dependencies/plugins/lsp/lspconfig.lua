local CONSTANTS = require("constants")

for _, value in pairs(CONSTANTS.REQUIRED_LANGUAGE_SERVERS) do
	vim.lsp.enable(value)
end

vim.api.nvim_command([[ hi def link LspReferenceText CursorLine ]])
vim.api.nvim_command([[ hi def link LspReferenceWrite CursorLine ]])
vim.api.nvim_command([[ hi def link LspReferenceRead CursorLine ]])
