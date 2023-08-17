local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General
keymap("i", "jk", "<Esc>", opts)

-- Refactor
keymap("x", "<leader>re", ":Refactor extract<CR>", opts)
keymap("x", "<leader>rf", ":Refactor extract_to_file<CR>", opts)
keymap("x", "<leader>rv", ":Refactor extract_var<CR>", opts)
keymap({ "n", "x" }, "<leader>ri", ":Refactor inline_var<CR>", opts)
keymap("n", "<leader>rb", ":Refactor extract_block<CR>", opts)
keymap("n", "<leader>rbf", ":Refactor extract_block_to_file<CR>", opts)

-- Tabs
keymap("n", "<S-h>", ":BufferPrevious<CR>", opts)
keymap("n", "<S-l>", ":BufferNext<CR>", opts)
keymap("n", "<Leader>w", ":BufferClose<CR>", opts)
keymap("n", "<Leader>q", ":BufferClose!<CR>", opts)
keymap("n", "<C-t>", ":tabnew<CR>", opts)
keymap("n", "ts", ":tab split<CR>", opts) -- Duplicate current tab

-- File navigation
keymap("n", "<C-f>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-p>", ":Files<CR>", opts)
keymap("n", "<C-g>", ":Rg<CR>", opts)
keymap("n", "bf", ":ls<CR>", opts) -- List all open buffers
keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts) -- Jump to definition
keymap("n", "gD", "<C-w><C-]><C-w>T", opts) -- Jump to definition in new tab
--keymap("n", "gdv", ":vertical dsplit <C-R><C-w><CR>", opts) -- Open definition in new vertical split screen
--keymap("n", "gds", "<C-w>d", opts) -- Open definition in new horizontal split screen
keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts) -- Open references

-- Git
keymap("n", "gb", ":BlamerToggle<CR>", opts)
keymap("n", "<Leader>dvo", ":DiffviewOpen<CR>", opts)
keymap("n", "<Leader>dvc", ":DiffviewClose<CR>", opts)

-- Diagnostics
keymap("n", "<Leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<Leader>d[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
keymap("n", "<Leader>d]", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
keymap("n", "<Leader>td", ":ToggleDiag<CR>", opts)
