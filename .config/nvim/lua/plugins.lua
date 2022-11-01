local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end
-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use("Mofiqul/dracula.nvim")
	use("kyazdani42/nvim-web-devicons")

	use({ "norcalli/nvim-colorizer.lua", run = ":NightfoxCompile" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.*",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({
		"L3MON4D3/LuaSnip",
		after = "nvim-cmp",
		tag = "v1.*",
	})
	use("saadparwaiz1/cmp_luasnip")
	use("onsails/lspkind-nvim")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
	})
	use("williamboman/mason.nvim")
	use("neovim/nvim-lspconfig")
	use({
		"williamboman/mason-lspconfig.nvim",
		requires = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		requires = {
			"nvim-treesitter/nvim-treesitter",
		},
	})
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		requires = {
			"nvim-treesitter/nvim-treesitter",
		},
	})
	use({
		"p00f/nvim-ts-rainbow",
		requires = {
			"nvim-treesitter/nvim-treesitter",
		},
	})
	use({
		"MunifTanjim/prettier.nvim",
		requires = {
			"neovim/nvim-lspconfig",
			"jose-elias-alvarez/null-ls.nvim",
		},
	})
	use("numToStr/Comment.nvim")
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
	})
	use("windwp/nvim-autopairs")
	use({ "windwp/nvim-ts-autotag", requires = {
		"nvim-treesitter/nvim-treesitter",
	} })
	use({ "dinhhuy258/git.nvim" })
	use({
		"lewis6991/gitsigns.nvim",
		tag = "release", -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
