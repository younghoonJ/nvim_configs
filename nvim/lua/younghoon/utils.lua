
local M = {}
function M.buff_selector()
	local results = {}
	local lst_bufs = vim.api.nvim_list_bufs()

	for _, buf in ipairs(lst_bufs) do
		if vim.api.nvim_buf_is_loaded(buf) then
			local filename = vim.api.nvim_buf_get_name(buf)
			table.insert(results, filename)
		end
	end

	vim.ui.select(results, { prompt = "Find buffer:" }, function(selected)
		if selected then
			vim.api.nvim_command("buffer " .. selected)
		end
	end)
end
-- vim.keymap.set("n", "<A-3>", "

return M
