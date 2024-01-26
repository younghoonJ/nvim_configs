local colors = {
    red = "#D61355",
    orange = "#F99417",
    cursor = "E5FDD1",
}

return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            require("which-key").setup({
                conf = {
                    window = {
                        border = "single",
                        position = "bottom",
                    },
                },
            })
        end,
    },
    {
        "petertriho/nvim-scrollbar",
        config = function()
            require("scrollbar").setup({
                handlers = {
                    cursor = true,
                    diagnostic = true,
                    gitsigns = false, -- Requires gitsigns
                    handle = true,
                    search = false, -- Requires hlslens
                    ale = false, -- Requires ALE
                },
                marks = {
                    Cursor = {
                        -- text = "◾",
                        text = "▬",
                        priority = 0,
                        gui = nil,
                        color = colors.cursor,
                        cterm = nil,
                        color_nr = nil, -- cterm
                        highlight = "Normal",
                    },
                    Search = {
                        text = { "-", "=" },
                        priority = 1,
                        gui = nil,
                        color = nil,
                        cterm = nil,
                        color_nr = nil, -- cterm
                        highlight = "Search",
                    },
                    Error = {
                        text = { "-", "=" },
                        priority = 2,
                        gui = nil,
                        color = colors.red,
                        cterm = nil,
                        color_nr = nil, -- cterm
                        highlight = "DiagnosticVirtualTextError",
                    },
                    Warn = {
                        text = { "-", "=" },
                        priority = 3,
                        gui = nil,
                        color = colors.orange,
                        cterm = nil,
                        color_nr = nil, -- cterm
                        highlight = "DiagnosticVirtualTextWarn",
                    },
                    Info = {
                        text = { "-", "=" },
                        priority = 4,
                        gui = nil,
                        color = nil,
                        cterm = nil,
                        color_nr = nil, -- cterm
                        highlight = "DiagnosticVirtualTextInfo",
                    },
                    Hint = {
                        text = { "-", "=" },
                        priority = 5,
                        gui = nil,
                        color = nil,
                        cterm = nil,
                        color_nr = nil, -- cterm
                        highlight = "DiagnosticVirtualTextHint",
                    },
                },
            })
        end,
    },
    {
        -- better ui for list, cmp...,
        "stevearc/dressing.nvim",
    },
    {
        -- window split
        "beauwilliams/focus.nvim",
        config = function()
            require("focus").setup({
                enable = true,
                hybridnumber = true,
                autoresize = { enagle = false },
                split = {
                    bufnew = false,
                    tmux = false,
                },
                ui = {
                    relativenumber = true,
                    cursorline = true,
                    colorcolumn = { enable = true, width = 80 },
                    absolutenumber_unfocussed = true,
                    signcolumn = false,
                },
            })
        end,
    },
    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "kyazdani42/nvim-web-devicons",
            opt = true,
        },
        config = function()
            local navic = require("nvim-navic")
            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    component_separators = { left = "", right = "" },
                    -- section_separators = { left = '', right = ''},
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = {
                        { "filename" },
                        {
                            navic.get_location,
                            cond = navic.is_available,
                            color = { fg = "#f3ca28" },
                        },
                    },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {},
            })
        end,
    },
    {
        "SmiteshP/nvim-navic",
        dependencies = { "neovim/nvim-lspconfig" },
    },
    {
        "j-hui/fidget.nvim",

        config = function()
            require("fidget").setup({
                text = {
                    --see ~/.vim/plugged/fidget.nvim/lua/fidget/spinners.lua
                    spinner = "zip",
                },
                window = {
                    relative = "win",
                    blend = 50,
                },
            })
        end,
    },
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
            "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        opts = {
            -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
            -- animation = true,
            -- insert_at_start = true,
            -- …etc.
        },
        version = "^1.0.0", -- optional: only update when a new 1.x version is released
    },
}
