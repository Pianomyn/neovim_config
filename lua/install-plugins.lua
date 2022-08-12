local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	packer_bootstrap = vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
	vim.cmd("packadd packer.nvim")
end


vim.cmd([[
augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins.lua source <afile> | PackerSync
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

	use ("wbthomason/packer.nvim")

	-- Editor
	use "kyazdani42/nvim-tree.lua"
	use "nvim-lualine/lualine.nvim"
	use "junegunn/fzf.vim"
	use "junegunn/fzf"
    use "RRethy/vim-illuminate"
    use "lukas-reineke/indent-blankline.nvim"

	-- Language
	use "neovim/nvim-lspconfig"
	use "williamboman/nvim-lsp-installer"
	use "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"
    use "ray-x/lsp_signature.nvim"

    -- Autocomplete
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-nvim-lua"
	use "L3MON4D3/LuaSnip"
	use "saadparwaiz1/cmp_luasnip"

    -- Syntax
	use "nvim-treesitter/nvim-treesitter"
	use "p00f/nvim-ts-rainbow"

	-- Git
	use {"sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim"}
    use "tpope/vim-fugitive"
	use "APZelos/blamer.nvim"

	-- Colors, Icons
	use "rafi/awesome-vim-colorschemes"
	use "tomasiser/vim-code-dark"
	use "kyazdani42/nvim-web-devicons"

	if packer_bootstrap then
		require("packer").sync()
	end
end)
