local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

keymap("n", "gd", ":lua vim.lsp.buf.definition()<cr>", opts)

keymap("n", "<C-f>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<C-g>", ":Telescope live_grep<CR>", opts)

keymap("n", "<Leader>d", ":BlamerToggle<CR>", opts)
