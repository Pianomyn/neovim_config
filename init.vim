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
" Vim
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy find files
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'

" Language
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hrsh7th/nvim-cmp/'
Plug 'rafi/awesome-vim-colorschemes'

" Directory
Plug 'ms-jpq/chadtree'

"Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
call plug#end()
" ---------------------------------------------------------------------------------------------------------------------

" Mappings




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
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }

-- vim.opt.foldmethod="expr"
--  vim.opt.foldexpr="nvim_treesitter#foldexpr()"
EOF
