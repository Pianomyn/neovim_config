local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- General
keymap("i", "jk", "<Esc>", opts)

-- File directory
keymap("n", "<C-t>", ":tabnew<CR>", opts)
keymap("n", "<S-h>", ":tabp<CR>", opts)
keymap("n", "<S-l>", ":tabn<CR>", opts)
keymap("n", "<C-f>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-p>", ":Files<CR>", opts)
keymap("n", "<C-g>", ":Rg<CR>", opts)

-- File navigation
keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts) -- Jump to definition
keymap("n", "gD", "<C-w><C-]><C-w>T", opts) -- Jump to definition in new tab
keymap("n", "gdv", ":vertical dsplit <C-R><C-w><CR>", opts) -- Open definition in new vertical split screen
keymap("n", "gds", "<C-w>d", opts) -- Open definition in new vertical split screen
--keymap("n", "gdv", "<C-w>v<C-w>lgd<CR>", opts) -- Open definition in new vertical split screen
keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts) -- Open references
keymap("n", "ts", ":tab split<CR>", opts) -- Duplicate current tab

-- Git
keymap("n", "gb", ":BlamerToggle<CR>", opts)
keymap("n", "<Leader>dvo", ":DiffviewOpen<CR>", opts)
keymap("n", "<Leader>dvc", ":DiffviewClose<CR>", opts)

-- Diagnostics
keymap("n", "<Leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<Leader>d[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
keymap("n", "<Leader>d]", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
keymap("n", "<Leader>td", ":ToggleDiag<CR>", opts)
