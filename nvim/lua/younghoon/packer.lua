local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	--
	-- colorscheme
	use("rebelot/kanagawa.nvim")
	use("catppuccin/nvim")
	use('folke/tokyonight.nvim')
	use("EdenEast/nightfox.nvim")

	use("numToStr/Comment.nvim") -- comment plugins, gcc, gcNj
	use("rstacruz/vim-closer") -- brackets closer

	-- UI
	use( "folke/which-key.nvim" )
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use("petertriho/nvim-scrollbar")
	use("stevearc/dressing.nvim") -- better ui for list, cmp...
	use("beauwilliams/focus.nvim") -- window split
	-- statusline
	use({
		"SmiteshP/nvim-gps",
		requires = { "nvim-treesitter/nvim-treesitter" },
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
	})
	use({
		"SmiteshP/nvim-navic",
		requires = { "neovim/nvim-lspconfig" },
	})
	use({ "j-hui/fidget.nvim" })
	use({ "fgheng/winbar.nvim" })
	use({
		"romgrk/barbar.nvim",
		wants = "nvim-web-devicons",
	})


	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		-- or                            , branch = '0.1.x',
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("nvim-treesitter/nvim-treesitter", {
		run = ":TSUpdate",
	})
	-- use("p00f/nvim-ts-rainbow") -- requires treesitter

	use("kyazdani42/nvim-web-devicons") -- nvim tree icons
	use("nvim-tree/nvim-tree.lua")
	use("RRethy/vim-illuminate")


	use("jose-elias-alvarez/null-ls.nvim") -- auto formatter
	use("lukas-reineke/indent-blankline.nvim")


	-- LSP Support
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	

	-- Autocompletion
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "ray-x/lsp_signature.nvim" })
	use({"onsails/lspkind.nvim"})  -- vscode like icons

	-- snippet
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" })
	use({
		"wiliamks/nice-reference.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional
			{
				"rmagatti/goto-preview",
				config = function()
					require("goto-preview").setup({})
				end,
			}, -- optional
		},
	})
	-- use {'glepnir/lspsaga.nvim'}
	--
	if packer_bootstrap then
		require("packer").sync()
	end
end)
