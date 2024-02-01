return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "rust", "python", "c", "cpp", "lua", "vim", "vimdoc", "query" },
			sync_install = false,
			auto_install = true,
			ignore_install = { "help" },
			highlight = {
				enable = true,
			},
			indent = { enable = true },
		})
	end,
}
