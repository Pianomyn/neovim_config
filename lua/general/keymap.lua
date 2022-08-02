local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

keymap("n", "gd", ":lua vim.lsp.buf.definition()<cr>", opts)
keymap("n", "gD", ":lua vim.lsp.buf.declaration()<cr>", opts)

keymap("n", "<C-f>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-p>", ":Files<CR>", opts)
keymap("n", "<C-g>", ":Rg<CR>", opts)

keymap("n", "<Leader>d", ":ToggleDiag<CR>", opts)
keymap("n", "gb", ":BlamerToggle<CR>", opts)

keymap("n", "<Leader>`", ":!", {noremap = true})
