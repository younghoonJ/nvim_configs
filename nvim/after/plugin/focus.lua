require("focus").setup({
    hybridnumber = true,
    autoresize = false,
    -- excluded_filetypes = {"toggleterm"},
    compatible_filetrees = {"nvimtree"},
    cursorline = true,
    colorcolumn = {enable = true, width = 80},
    absolutenumber_unfocussed = true,
    relativenumber = true
})

-- vim.api.nvim_set_keymap('n', '<leader>h', ':FocusSplitLeft<CR>', { silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>j', ':FocusSplitDown<CR>', { silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>k', ':FocusSplitUp<CR>', { silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>l', ':FocusSplitRight<CR>', { silent = true })