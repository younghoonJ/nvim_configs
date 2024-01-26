return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "python", "c", "c++", "lua", "vim", "vimdoc", "query" },
            sync_install = false,
            auto_install = true,
            -- ignore_install = { "javascript" },
            highlight = {
                enable = true,
            },
            indent = { enable = true },
        })
    end
}
