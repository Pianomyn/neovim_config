local keymap_functions = require("core.keymap.keymap_functions")

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- [Default] General
keymap("i", "jk", "<Esc>", opts)

-- [Default] Buffers, Tabs and Windows
keymap("n", "<Leader>bd", keymap_functions.delete_buffer_by_number, opts)

keymap("n", "<S-h>", ":tabprevious<CR>", opts)
keymap("n", "<S-l>", ":tabnext<CR>", opts)
keymap("n", "<C-t>", ":tabnew<CR>", opts)

-- Interface
keymap("n", "<C-f>", ":NvimTreeToggle<CR>", opts) -- nvim-tree
keymap("n", "<C-p>", ":Files<CR>", opts) -- fzf
keymap("n", "<C-g>", ":Rg<CR>", opts) -- fzf
keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts) -- lspconfig
keymap("n", "gD", "<C-w><C-]><C-w>T", opts) -- lspconfig
keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts) -- lspconfig

-- Git
keymap("n", "gb", ":BlamerToggle<CR>", opts) -- blamer.nvim
keymap("n", "<Leader>dvo", ":DiffviewOpen<CR>", opts) -- diffview
keymap("n", "<Leader>dvc", ":DiffviewClose<CR>", opts) -- diffview

-- Refactor
keymap("x", "<Leader>re", ":Refactor extract<CR>", opts) -- refactoring.nvim
keymap("x", "<Leader>rf", ":Refactor extract_to_file<CR>", opts) -- refactoring.nvim
keymap("x", "<Leader>rv", ":Refactor extract_var<CR>", opts) -- refactoring.nvim
keymap({ "n", "x" }, "<Leader>ri", ":Refactor inline_var<CR>", opts) -- refactoring.nvim
keymap("n", "<Leader>rb", ":Refactor extract_block<CR>", opts) -- refactoring.nvim
keymap("n", "<Leader>rbf", ":Refactor extract_block_to_file<CR>", opts) -- refactoring.nvim

-- Diagnostics
keymap("n", "<Leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)  -- lspconfig
keymap("n", "<Leader>d[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)  -- lspconfig
keymap("n", "<Leader>d]", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)  -- lspconfig
keymap("n", "<Leader>td", ":ToggleDiag<CR>", opts) -- toggle_lsp_diagnostics
