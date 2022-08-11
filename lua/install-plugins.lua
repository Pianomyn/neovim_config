local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd("packadd packer.nvim")
end


local packer = require("packer")
require("packer").init({
    compile_on_sync = false
})

return packer.startup(
    function(use)

        use ('wbthomason/packer.nvim')

        -- Editor
        use ({
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons",
            },
            config = function()
                require("plugins/nvim-tree")
            end,
            tag = "nightly" -- optional, updated every week. (see issue #1193)
        })
        use ({
            "nvim-lualine/lualine.nvim",
            config = function()
                require("plugins/lualine")
            end,
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        })

        -- Language
        use ({
                "hrsh7th/nvim-cmp",
                config = function()
                    require("plugins/cmp")
                end,
        })
                use "hrsh7th/cmp-nvim-lsp"
                use "hrsh7th/cmp-buffer"
                use "hrsh7th/cmp-nvim-lua"
		use "L3MON4D3/LuaSnip"
		use "saadparwaiz1/cmp_luasnip"
        
        use ({
            "nvim-treesitter/nvim-treesitter", 
            requires = {
                "p00f/nvim-ts-rainbow",
            },
            config = function()
                require("plugins/nvim-treesitter")
            end
        })
        use({
            "junegunn/fzf.vim",
            requires = {
                "junegunn/fzf"
            }
        })
        use ({
            "neovim/nvim-lspconfig",
            requires = {
                "williamboman/nvim-lsp-installer",
                "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"
            },
            config = function()
                require("plugins/nvim-lspconfig")
            end
        })

        -- Git
        use ({ 'sindrets/diffview.nvim',
            requires = 'nvim-lua/plenary.nvim',
            config = function()
                require("plugins/diffview")
            end
        })
        use "tpope/vim-fugitive"
        use ({
            "APZelos/blamer.nvim",
            config = function()
                require("plugins/blamer")
            end
        })

        -- Colors, Icons
        use "rafi/awesome-vim-colorschemes"
        use "tomasiser/vim-code-dark"

        if packer_bootstrap then
            require("packer").sync()
        end
    end
)
