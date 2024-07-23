local keymap_functions = require("general.keymap.keymap_functions")

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General
keymap("i", "jk", "<Esc>", opts)

-- Buffers, Tabs and Windows
keymap("n", "bl", ":buffers<CR>", opts)
keymap("n", "bo", keymap_functions.switch_to_buffer_by_number, opts)
keymap("n", "bd", keymap_functions.delete_buffer_by_number, opts)

keymap("n", "<Leader>wh", ":split<CR>", opts)
keymap("n", "<Leader>wv", ":vsplit<CR>", opts)

keymap("n", "<S-h>", ":tabprevious<CR>", opts)
keymap("n", "<S-l>", ":tabnext<CR>", opts)
keymap("n", "<C-t>", ":tabnew<CR>", opts)

-- File navigation
keymap("n", "<C-f>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-p>", ":Files<CR>", opts)
keymap("n", "<C-g>", ":Rg<CR>", opts)
keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts) -- Jump to definition
keymap("n", "gD", "<C-w><C-]><C-w>T", opts) -- Jump to definition in new tab
keymap("n", "gdv", ":vertical dsplit <C-R><C-w><CR>", opts) -- Open definition in new vertical split screen
keymap("n", "gdh", "<C-w>d", opts) -- Open definition in new horizontal split screen
keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts) -- Open references

-- Git
keymap("n", "gb", ":BlamerToggle<CR>", opts)
keymap("n", "<Leader>dvo", ":DiffviewOpen<CR>", opts)
keymap("n", "<Leader>dvc", ":DiffviewClose<CR>", opts)

-- Refactor
keymap("x", "<leader>re", ":Refactor extract<CR>", opts)
keymap("x", "<leader>rf", ":Refactor extract_to_file<CR>", opts)
keymap("x", "<leader>rv", ":Refactor extract_var<CR>", opts)
keymap({ "n", "x" }, "<leader>ri", ":Refactor inline_var<CR>", opts)
keymap("n", "<leader>rb", ":Refactor extract_block<CR>", opts)
keymap("n", "<leader>rbf", ":Refactor extract_block_to_file<CR>", opts)

-- Diagnostics
keymap("n", "<Leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<Leader>d[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
keymap("n", "<Leader>d]", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
keymap("n", "<Leader>td", ":ToggleDiag<CR>", opts)
