return {
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     priority = 1000, -- make sure to load this before all the other start plugins
    --     config = function()
    --         vim.cmd([[colorscheme catppuccin]])
    --     end,
    -- },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.cmd([[colorscheme rose-pine]])
        end,
    },
}
