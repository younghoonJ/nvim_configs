vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "exit to the file explorer" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to the system clipboard" })
vim.keymap.set("n", "<C-j>", "<C-d>zz", { desc = "half page jumping" })
vim.keymap.set("n", "<C-k>", "<C-u>zz", { desc = "half page jumping" })
vim.keymap.set("n", "n", "nzzzv", { desc = "keep cursor center when searching" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "keep cursor center when searching" })
vim.keymap.set("n", "<A-k>", ":m.-2<CR>==g", { desc = "move current line" })
vim.keymap.set("n", "<A-j>", ":m.+1<CR>==g", { desc = "move current line" })

vim.keymap.set("i", "<A-k>", "<Esc>:m.-2<CR>==gi", { desc = "move current line" })
vim.keymap.set("i", "<A-j>", "<Esc>:m.+1<CR>==gi", { desc = "move current line" })

vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "move visual block" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>yv=gv", { desc = "move visual block" })
vim.keymap.set("v", "[", "c[]<Esc>P", { desc = "surround visual bloks with [" })
vim.keymap.set("v", "{", "c{}<Esc>P", { desc = "surround visual bloks with {" })
vim.keymap.set("v", "(", "c()<Esc>P", { desc = "surround visual bloks with (" })
vim.keymap.set("v", "<", "c<><Esc>P", { desc = "surround visual bloks with <" })
vim.keymap.set("v", '"', 'c""<Esc>P', { desc = 'surround visual bloks with "' })
vim.keymap.set("v", "'", "c''<Esc>P", { desc = "surround visual bloks with '" })

local kmap_telescope = {
	["<leader>ff"] = { "<Cmd>lua require('telescope.builtin').find_files()<CR>')", "Telescope: [F]ind [F]iles" },
	["<leader>fg"] = { "<Cmd>lua require('telescope.builtin').live_grep()<CR>')", "Telescope: live [G]rep" },
	["<leader>fb"] = { "<Cmd>lua require('telescope.builtin').buffers()<CR>')", "Telescope: [F]ind [B]uffers" },
	["<leader>fh"] = { "<Cmd>lua require('telescope.builtin').help_tags()<CR>')", "Telescope: [F]ind live [h]tans" },
	["<leader>fc"] = {
		"<Cmd>lua require('telescope.builtin').grep_string({search = vim.fn.input('Grep > '), desc = {} } )<CR>",
		"Telescope [F]ind live [G]rep",
	},
}

local kmap_buffer = {
	name = "buffer",
	["<A-1>"] = { "<Cmd>lua require('younghoon.utils').nvim_tree_toggle() <CR>')", "NvimTreeToggle" },
	["<A-2>"] = { ":BufferNext<CR>", "Buffer Next" },
	["<A-3>"] = { "<Cmd>lua require('younghoon.utils').buff_selector() <CR>", "BufferPick" },
	["<A-4>"] = { ":BufferDelete<CR>", "Buffer Delete" },
}

local kmap_window = {
	name = "window",
	["<leader>h"] = { ":FocusSplitLeft<CR>", "Split Left" },
	["<leader>j"] = { ":FocusSplitDown<CR>", "Split Down" },
	["<leader>k"] = { ":FocusSplitUp<CR>", "Split Up" },
	["<leader>l"] = { ":FocusSplitRight<CR>", "Split Right" },
	["<leader><F4>"] = { ":close<CR>", "Close window" },
}

local kmap_tab = {
	["<leader>to"] = { ":tabnew<CR>", "[T]ab [O]pen" },
	["<leader>tx"] = { ":tabclose<CR>", "[T]ab [C]lose" },
	["<leader>tn"] = { ":tabn<CR>", "[T]ab [N]ext" },
	["<leader>tp"] = { ":tabp<CR>", "[T]ab [P]rev" },
	["<C-t>"] = { ":tabn<CR>", "[T]ab [N]ext" },
}

local kmap_dap = {
	["<leader><F2>"] = { ":lua require('dap').terminate()<CR>", "Tereminate" },
	["<F7>"] = { ":lua require('dap').step_into()<CR>", "Step Into" },
	["<F8>"] = { ":lua require('dap').step_over()<CR>", "Step Over" },
	["<S-F8>"] = { ":lua require('dap').step_out()<CR>", "Step Out" },
	["<F9>"] = { ":lua require('dap').continue()<CR>", "Continue" },
	["<leader>B"] = { ":lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<CR>", "Conditional Breakpoint" },
	["<leader>b"] = { ":lua require('dap').toggle_breakpoint()<CR>", "Toggle Breakpoint" },
	-- ['<Leader>lp'] ={":require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)", },
	["<leader>dr"] = { ":require('dap').repl.open()<CR>", "Open Repl" },
	["<leader>dl"] = { ":require('dap').run_last()<CR>", "Run Last" },
}

-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '<F2>', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set("n", "<F2>", vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
-- vim.keymap.set('n', '<space>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, bufopts)

local kmap_lsp = {
	["<F2>"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next diagnostic" },
	["<leader><F6>"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "[R]e[n]ame" },
	["<leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "[C]ode [A]ction" },
	["<leader>i"] = { "<cmd> lua vim.lsp.buf.hover()<CR>", "Hover [I]nformation" },
	["<leader>p"] = { "<cmd> lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },
	["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "[G]oto [D]efinition" },
	["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "[G]oto [I]mplementation" },
	["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "[G]oto [R]eferences" },
	["<C-l>"] = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format Document" },
	["<C-b>"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "[G]oto [D]efinition" },
}

local wk = require("which-key")
wk.register(kmap_buffer, { noremap = true, silent = true })
wk.register(kmap_window, { noremap = true, silent = true })
wk.register(kmap_dap, { noremap = true, silent = false })
wk.register(kmap_telescope, { noremap = true, silent = true })

local M = {}

local function __maps__(client, bufnr)
	print(client.name)
	if (client.name == 'pyright') then
		vim.keymap.set("i", '<C-m>', "<Esc>A:<CR>", { desc = '"Ctrl + Enter map"' })
	elseif (client.name == 'clangd') then
		vim.keymap.set("i", '<C-m>', "<Esc>A{<CR>}<Esc>O", { desc = '"Ctrl + Enter map"' })
	end
	
	wk.register(kmap_lsp, { noremap = true, silent = true, buffer = bufnr })
end

function M.attach(client, bufnr)
	__maps__(client, bufnr)
end

return M
