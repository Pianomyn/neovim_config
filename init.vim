" Basic
" ---------------------------------------------------------------------------------------------------------------------
set mouse=a
set paste

set colorcolumn=120
set number " Line numbers
syntax on
set termguicolors
set background=dark

set expandtab " Replace tab character with spaces
set tabstop=4 " The width of a tab character in spaces
set shiftwidth=4 " The width of an indent in spaces
set smarttab " Will insert spaces as necessary to reach the next indent
" ---------------------------------------------------------------------------------------------------------------------


" Plugins
" ---------------------------------------------------------------------------------------------------------------------
" Install vim-plug if it doesn't installed yet
if empty(glob("~/.config/nvim/autoload/"))
  execute 'mkdir ~/.config/nvim/autoload' 
endif

if empty(glob("~/.config/nvim/autoload/plug.vim"))
  execute 'wget -O ~/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif


call plug#begin("~/.config/nvim/plugged")
" Vim
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy find files
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'

" Language
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Directory
Plug 'ms-jpq/chadtree'

"Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
call plug#end()
" ---------------------------------------------------------------------------------------------------------------------

" Mappings




lua << EOF
require("nvim-lsp-installer").setup {
    automatic_installation = true
}

local lspconfig = require('lspconfig')

lspconfig.pyright.setup {}

local configs = require'nvim-treesitter.configs'
configs.setup {
    ensure_installed = { "python" }, 
    highlight = {
        enable = true,
    },
    indent = { 
        enable = true,
    },
}
local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true }
local function nkeymap(key, map)
    keymap('n', key, map, opts)
end

nkeymap('gd',':lua vim.lsp.buf.definition()<cr>')
-- vim.opt.foldmethod="expr"
--  vim.opt.foldexpr="nvim_treesitter#foldexpr()"
EOF
