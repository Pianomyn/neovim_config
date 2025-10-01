local dependencies = require("utils.dependencies")

for _, value in pairs(dependencies.required_language_servers) do
  vim.lsp.enable(value)
end

vim.api.nvim_command([[ hi def link LspReferenceText CursorLine ]])
vim.api.nvim_command([[ hi def link LspReferenceWrite CursorLine ]])
vim.api.nvim_command([[ hi def link LspReferenceRead CursorLine ]])
