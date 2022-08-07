local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- File navigation
keymap("n", "gd", ":lua vim.lsp.buf.definition()<cr>", opts)
keymap("n", "gD", ":lua vim.lsp.buf.declaration()<cr>", opts)

-- File directory
keymap("n", "<C-f>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-p>", ":Files<CR>", opts)
keymap("n", "<C-g>", ":Rg<CR>", opts)

-- Git
keymap("n", "gb", ":BlamerToggle<CR>", opts)
keymap("n", "<Leader>dvo", ":DiffviewOpen<CR>", opts)
keymap("n", "<Leader>dvc", ":DiffviewClose<CR>", opts)

-- Diagnostics
keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
keymap("n", "<Leader>td", ":ToggleDiag<CR>", opts)
