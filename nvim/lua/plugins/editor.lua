return {
    {
        -- gcc, gcNj
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({})
        end,
    },
    { 'echasnovski/mini.nvim', version = '*',
        config = function()
            require("mini.pairs").setup()
        end

},

}
