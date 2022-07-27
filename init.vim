" Basic
" ---------------------------------------------------------------------------------------------------------------------
set mouse=a
set paste

set colorcolumn=120
set number " Line numbers
set termguicolors
set background=dark
set encoding=UTF-8

set expandtab " Replace tab character with spaces
set tabstop=4 " The width of a tab character in spaces
set shiftwidth=4 " The width of an indent in spaces
set smarttab " Will insert spaces as necessary to reach the next indent

" Patterns to ignore in vimgrep
:set wildignore+=volumes/**
" ---------------------------------------------------------------------------------------------------------------------


" Plugins
" ---------------------------------------------------------------------------------------------------------------------
" Install vim-plug if it doesn't installed yet
if empty(glob("~/.config/nvim/autoload/"))
  execute '!mkdir ~/.config/nvim/autoload' 
endif

if empty(glob("~/.config/nvim/autoload/plug.vim"))
  execute '!wget -O ~/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif


call plug#begin("~/.config/nvim/plugged")
" Editor 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy find files
Plug 'preservim/nerdcommenter'

" Language
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hrsh7th/nvim-cmp/'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'

" Directory
Plug 'ms-jpq/chadtree'

"Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'

" Colors, Icons
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tomasiser/vim-code-dark'
Plug 'ryanoasis/vim-devicons'
call plug#end()

:colorscheme codedark
let g:airline_theme="base16_material_vivid"
let g:blamer_delay = 100 

" ---------------------------------------------------------------------------------------------------------------------


" Mappings
nnoremap <C-f> <cmd>CHADopen<cr>




lua << EOF
--vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]]) 
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

local cmp = require'cmp'

  cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), 
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    })
  })


  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }

EOF
