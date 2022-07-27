local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
  vim.cmd [[packadd packer.nvim]]
end

local packer = require("packer")
packer.init({
compile_on_sync = false
})
return packer.startup(function(use)

	-- Editor
	use ({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins/lualine")
		end
	})

	-- Language
    use ({
        "nvim-telescope/telescope.nvim",
        config = function()
            require("plugins/telescope")
        end,
        requires = {'nvim-lua/plenary.nvim'} 
    })
	use ({
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins/nvim-lspconfig")
        end
    })
	use ({
        "williamboman/nvim-lsp-installer",
        config = function()
            require("plugins/nvim-lsp-installer")
       end
    })
	use ({
        "nvim-treesitter/nvim-treesitter", 
        config = function()
            require("plugins/nvim-treesitter")
        end
    })
	use ({
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins/nvim-cmp")
        end
    })
	use ({
        "hrsh7th/cmp-nvim-lsp",
        config = function()
            require("plugins/cmp-nvim-lsp")
        end
    })
	use ({
        "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
        config = function()
            require("plugins/toggle-lsp-diagnostics")
        end
    })

	-- Directory
	use ({
		"kyazdani42/nvim-tree.lua",
		requires = {
		"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		config = function()
			require("plugins/nvim-tree")
		end,
		tag = "nightly" -- optional, updated every week. (see issue #1193)
	})
	

	-- Git
	use "airblade/vim-gitgutter"
	use "tpope/vim-fugitive"
	use "APZelos/blamer.nvim"

	-- Colors, Icons
	use "rafi/awesome-vim-colorschemes"
	use "tomasiser/vim-code-dark"
	use "ryanoasis/vim-devicons"

	if packer_bootstrap then
		require("packer").sync()
	end
end)
