local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

keymap("n", "gd", ":lua vim.lsp.buf.definition()<cr>", opts)

keymap("n", "<C-f>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-p>", ":Files<CR>", opts)
keymap("n", "<C-g>", ":Rg<CR>", opts)

keymap("n", "<Leader>d", ":BlamerToggle<CR>", opts)

keymap("n", "<Leader>`", ":!", {noremap = true})
