-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- colorscheme
    use "rebelot/kanagawa.nvim"
    use 'ayu-theme/ayu-vim'

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use('numToStr/Comment.nvim') -- comment plugins, gcc, gcNj
    use('rstacruz/vim-closer') -- brackets closer

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    -- use("p00f/nvim-ts-rainbow") -- requires treesitter

    use('kyazdani42/nvim-web-devicons') -- nvim tree icons
    use('nvim-tree/nvim-tree.lua')
    use("RRethy/vim-illuminate")

    -- statusline
    use{ "SmiteshP/nvim-gps", 
    requires = {"nvim-treesitter/nvim-treesitter"}}
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons',
        opt = true }
    }
    use {
        "SmiteshP/nvim-navic",
        requires ={ "neovim/nvim-lspconfig"}
    }
    use({'romgrk/barbar.nvim', wants = 'nvim-web-devicons' })
    -- use('akinsho/toggleterm.nvim') -- terminal
    use("jose-elias-alvarez/null-ls.nvim") -- auto formatter
    use("lukas-reineke/indent-blankline.nvim")
    -- 
    -- use {
        --     "folke/trouble.nvim",
        --     requires = "kyazdani42/nvim-web-devicons",
        --     config = function() require("trouble").setup {} end
        -- }

        use {
            'glepnir/lspsaga.nvim',
            requires = {
                -- LSP Support
                { 'neovim/nvim-lspconfig' },
                { 'williamboman/mason.nvim' },
                { 'williamboman/mason-lspconfig.nvim' },

                -- Autocompletion
                { 'hrsh7th/nvim-cmp' },
                { 'hrsh7th/cmp-buffer' },
                { 'hrsh7th/cmp-path' },
                { 'saadparwaiz1/cmp_luasnip' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/cmp-nvim-lua' },
                { 'onsails/lspkind.nvim'},

                -- Snippets
                { 'L3MON4D3/LuaSnip' },
                { 'rafamadriz/friendly-snippets' },
            }
        }
    end)
