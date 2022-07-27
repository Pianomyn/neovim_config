local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true }
local function nkeymap(key, map)
    keymap('n', key, map, opts)
end

nkeymap('gd',':lua vim.lsp.buf.definition()<cr>')
