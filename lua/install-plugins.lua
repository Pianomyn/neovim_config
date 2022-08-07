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
            "neovim/nvim-lspconfig",
            requires = {
                "hrsh7th/nvim-cmp",
                "hrsh7th/cmp-nvim-lsp",
                "williamboman/nvim-lsp-installer",
                "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"
            },
            config = function()
                require("plugins/nvim-lspconfig")
            end
        })
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
