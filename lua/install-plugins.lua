local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd("packadd packer.nvim")
end


vim.cmd([[
augroup packer_user_config
    autocmd!
    autocmd BufWritePost install-plugins.lua source <afile> | PackerSync
augroup end
]])


local status, packer = pcall(require, "packer")
if not status then
    return
end

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({border = "rounded"})
        end
    },
})

return packer.startup(function(use)

    -- Packer
    use ("wbthomason/packer.nvim")
    
    -- Package Installer
    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    }

    -- Editor
    use ({ 
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons"
        },
    })
    use "nvim-lualine/lualine.nvim"
    use ({
        "junegunn/fzf.vim",
        requires = {
            "junegunn/fzf",
        },
    })
    use "lukas-reineke/indent-blankline.nvim"
    use "RRethy/vim-illuminate"

    -- Language
    use "neovim/nvim-lspconfig"
    use "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"
    use "ray-x/lsp_signature.nvim"

    -- Formatting and Linting
    use {
      "jose-elias-alvarez/null-ls.nvim",
    }

    -- Autocomplete
    use ({
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lua",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
    })

    -- Syntax
    use ({
        "nvim-treesitter/nvim-treesitter",
        requires = {
            "p00f/nvim-ts-rainbow",
        },
    })

    -- Git
    use ({
        "sindrets/diffview.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
    use "tpope/vim-fugitive"
    use "APZelos/blamer.nvim"
    use "lewis6991/gitsigns.nvim"

    -- Colors, Themes 
    use "rafi/awesome-vim-colorschemes"
    use "tomasiser/vim-code-dark"

    if packer_bootstrap then
        require("packer").sync()
    end
end)
