-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
-- vim.cmd.packadd('packer.nvim')
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    --
    -- colorscheme
    use "rebelot/kanagawa.nvim"
    use 'catppuccin/nvim'

    use 'EdenEast/nightfox.nvim'

    use {"folke/which-key.nvim"}

    use('numToStr/Comment.nvim') -- comment plugins, gcc, gcNj
    use('rstacruz/vim-closer') -- brackets closer

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = {'nvim-lua/plenary.nvim'}
    }
    use('nvim-treesitter/nvim-treesitter', {
        run = ':TSUpdate'
    })
    -- use("p00f/nvim-ts-rainbow") -- requires treesitter

    use('kyazdani42/nvim-web-devicons') -- nvim tree icons
    use('nvim-tree/nvim-tree.lua')
    use("RRethy/vim-illuminate")

    -- statusline
    use {
        "SmiteshP/nvim-gps",
        requires = {"nvim-treesitter/nvim-treesitter"}
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }
    use {
        "SmiteshP/nvim-navic",
        requires = {"neovim/nvim-lspconfig"}
    }
    use {"j-hui/fidget.nvim"}
    use { 'fgheng/winbar.nvim' }
    use({
        'romgrk/barbar.nvim',
        wants = 'nvim-web-devicons'
    })


    use("jose-elias-alvarez/null-ls.nvim") -- auto formatter
    use("lukas-reineke/indent-blankline.nvim")
    -- 
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons"
    }

    -- LSP Support
    use {'neovim/nvim-lspconfig'}
    use {'williamboman/mason.nvim'}
    use {'williamboman/mason-lspconfig.nvim'}

    -- Autocompletion
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-nvim-lua'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'saadparwaiz1/cmp_luasnip'}
    use {'onsails/lspkind.nvim'}

    -- snippet
    use {'L3MON4D3/LuaSnip'}
    use {'rafamadriz/friendly-snippets'}
    use {
        'wiliamks/nice-reference.nvim',
        requires = {'kyazdani42/nvim-web-devicons', -- optional
        {
            'rmagatti/goto-preview',
            config = function()
                require('goto-preview').setup {}
            end
        } -- optional
        }
    }
    -- use {'glepnir/lspsaga.nvim'}
end)
