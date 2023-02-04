local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

local utils = require("younghoon.utils")
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = utils.start_nvim_tree_on_dir})

nvimtree.setup({
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})

