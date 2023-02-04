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


-- PLUGIN: nvim-tree

function M.nvim_tree_toggle()
	local curwin = vim.api.nvim_get_current_win()
    local curbuf = vim.api.nvim_win_get_buf(curwin)
    local bufname = vim.api.nvim_buf_get_name(curbuf)
	if require("nvim-tree.view").is_visible() then
		if bufname:match("NvimTree") then 
			vim.cmd("NvimTreeClose")
		else
			vim.cmd("NvimTreeFocus")
		end
	else
		vim.cmd("NvimTreeOpen")
	end
end

function M.start_nvim_tree_on_dir(data)
	local is_buff_dir = vim.fn.isdirectory(data.file) == 1
	if not is_buff_dir then
		return
	end
	vim.cmd.enew()
	vim.cmd.bw(data.buf)
	vim.cmd.cd(data.file)
	require("nvim-tree.api").tree.open() -- open the tree
end


return M
