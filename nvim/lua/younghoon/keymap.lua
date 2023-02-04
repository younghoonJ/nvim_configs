vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "exit to the file explorer" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to the system clipboard" })
vim.keymap.set("n", "<C-j>", "<C-d>zz", { desc = "half page jumping" })
vim.keymap.set("n", "<C-k>", "<C-u>zz", { desc = "half page jumping" })
vim.keymap.set("n", "n", "nzzzv", {desc = "keep cursor center when searching"})
vim.keymap.set("n", "N", "Nzzzv", {desc = "keep cursor center when searching"})

vim.keymap.set("v", "J", ":m '>+1<CR>yv=gv", { desc = "move visual block" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move visual block" })
vim.keymap.set("v", "[", "c[]<ESC>P", {desc = "surround visual bloks with ["})
vim.keymap.set("v", "{", "c{}<ESC>P", {desc = "surround visual bloks with {"})
vim.keymap.set("v", "(", "c()<ESC>P", {desc = "surround visual bloks with ("})
vim.keymap.set("v", "<", "c<><ESC>P", {desc = "surround visual bloks with <"})

-- telescope
do
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files,  { desc = "Telescope: [F]ind [F]iles" })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep,  { desc = "Telescope: live [G]rep" })
    vim.keymap.set('n', '<leader>fb', builtin.buffers,  { desc = "Telescope: [F]ind [B]uffers" })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags,  { desc = "Telescope: [F]ind live [h]tans" })
    vim.keymap.set('n', '<leader>fc', function() builtin.grep_string({ search = vim.fn.input("Grep > "), desc={} });end, {desc = "Telescope: [F]ind live [h]rep"})
end


-- nvim-tree
vim.keymap.set("n", "<A-1>", "<Cmd>lua require('younghoon.utils').nvim_tree_toggle() <CR>')", {desc = "NvimTreeToggle"})

local kmap_buffer = {
    name = "buffer",
    ["<A-2>"] = {":BufferNext<CR>", "Buffer Next" },
    ["<A-3>"] = {"<Cmd>lua require('younghoon.utils').buff_selector() <CR>", "BufferPick"},
    ["<A-4>"] = {":BufferDelete<CR>","Buffer Delete"},
}

local kmap_window = {
    name = "window",
    ['<leader>h']= {':FocusSplitLeft<CR>', "Split Left" },
    ['<leader>j']= {':FocusSplitDown<CR>', "Split Down" },
    ['<leader>k']= {':FocusSplitUp<CR>',  "Split Up" },
    ['<leader>l']= {':FocusSplitRight<CR>',  "Split Right" },
    ['<leader><F4>']= {':close<CR>', "Close window"},
}


local kmap_tab = {
    ["<leader>to"] = {":tabnew<CR>",   "[T]ab [O]pen" },
    ["<leader>tx"] = {":tabclose<CR>", "[T]ab [C]lose" },
    ["<leader>tn"] = {":tabn<CR>",     "[T]ab [N]ext" },
    ["<leader>tp"] = {":tabp<CR>",     "[T]ab [P]rev" },
    ["<C-t>"] = { ":tabn<CR>",  "[T]ab [N]ext" },
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
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)

local kmap_lsp = {
    ["<F2>"] =  {"<cmd>lua vim.diagnostic.goto_next()<CR>", "Next diagnostic" },
    ["<leader><F6>"] = {"<cmd>lua vim.lsp.buf.rename()<CR>", "[R]e[n]ame" },
    ["<leader>rn"] = {"<cmd>lua vim.lsp.buf.rename()<CR>", "[R]e[n]ame" },
    ["<leader>ca"] = {"<cmd>lua vim.lsp.buf.code_action()<CR>", "[C]ode [A]ction"},
    ["<leader>i"] = {"<cmd> lua vim.lsp.buf.hover()<CR>", "Hover [I]nformation"},
    ["gd"] = {"<cmd>lua vim.lsp.buf.definition()<CR>", "[G]oto [D]efinition"},
    ["gi"] = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "[G]oto [I]mplementation"},
    ["gr"] = {"<cmd>lua vim.lsp.buf.references()<CR>", "[G]oto [R]eferences"},
    ["<C-l>"] = {"<cmd>lua vim.lsp.buf.format()<CR>",  "Format Document" },
    ["<C-b>"] = {"<cmd>lua vim.lsp.buf.definition()<CR>", "[G]oto [D]efinition" },
        
}



local opts = { noremap = true, silent = true }

local wk = require "which-key"
wk.register(kmap_buffer, opts)
wk.register(kmap_window, opts)
wk.register(kmap_buffer, opts)

local M = {}

local function __maps__(client, bufnr)
    wk.register(kmap_lsp, {noremap = true, silent = true, buffer = bufnr,})

end

function M.attach(client, bufnr)
    __maps__(client, bufnr)
end

return M
