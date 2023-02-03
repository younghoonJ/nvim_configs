vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "exit to the file explorer" })

vim.keymap.set("v", "J", ":m '>+1<CR>yv=gv", { desc = "move visual block" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move visual block" })

vim.keymap.set("n", "<C-j>", "<C-d>zz", { desc = "half page jumping" })
vim.keymap.set("n", "<C-k>", "<C-u>zz", { desc = "half page jumping" })

-- keep cursor center when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to the system clipboard" })


local opts = { noremap = true, silent = true }

local kmap_buffer = {
    name = "buffer",
    ["<A-2>"] = {":BufferNext<CR>", "Buffer Next" },
    ["<A-3>"] = {"<Cmd>lua require('younghoon.utils').buff_selector() <CR>", "BufferPick"},
    ["<A-4>"] = {":BufferDelete<CR>","Buffer Delete"},
}

local kmap_window = {
    name = "window",
    ["<leader>sv"] = {"<C-w>v",  "[S]plit window [V]ertically" },
    ["<leader>sh"] = {"<C-w>s",  "[S]plit window [H]orizontally" },
    ["<leader>se"] = {"<C-w>=",  "[S]plit windows [E]qual width" },
    ["<leader>sc"] = {":close<CR>",  "[S]plit window [C]lose" },
}

local kmap_tab = {
    ["<leader>to"] = {":tabnew<CR>",   "[T]ab [O]pen" },
    ["<leader>tx"] = {":tabclose<CR>", "[T]ab [C]lose" },
    ["<leader>tn"] = {":tabn<CR>",     "[T]ab [N]ext" },
    ["<leader>tp"] = {":tabp<CR>",     "[T]ab [P]rev" },
    ["<C-t>"] = { ":tabn<CR>",  "[T]ab [N]ext" },
}

local wk = require "which-key"
wk.register(kmap_buffer, opts)
wk.register(kmap_window, opts)
wk.register(kmap_buffer, opts)

local M = {}

local function __maps__(client, bufnr)
    
    -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    -- vim.keymap.set('n', '<F2>', vim.diagnostic.goto_prev, opts)
    -- vim.keymap.set("n", "<F2>", vim.diagnostic.goto_next, opts)
    -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

    -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wl', function()
    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)

    local kmap_lsp = {
        ["<F2>"] =  {"<cmd>lua vim.diagnostic.goto_next()<CR>", "Next diagnostic" },
        ["<leader>"] = {
            ["<F6>"] = {"<cmd>lua vim.lsp.buf.rename()<CR>", "[R]e[n]ame" },
            ["rn"] = {"<cmd>lua vim.lsp.buf.rename()<CR>", "[R]e[n]ame" },
            ["ca"] = {"<cmd>lua vim.lsp.buf.code_action()<CR>", "[C]ode [A]ction"},
        },
        g = {
            name = "GoTo",
            d = {"<cmd>lua vim.lsp.buf.definition()<CR>", "[G]oto [D]efinition"},
            i = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "[G]oto [I]mplementation"},
            r = {"<cmd>lua vim.lsp.buf.references()<CR>", "[G]oto [R]eferences"},
        },
        ["<C-l>"] = {"<cmd>lua vim.lsp.buf.format()<CR>",  "Format Document" },
        ["<C-b>"] = {"<cmd>lua vim.lsp.buf.definition()<CR>", "[G]oto [D]efinition" },
        
    }


    local bufopts = {noremap = true, silent = true, buffer = bufnr,}
    
    wk.register(kmap_lsp, bufopts)

end

function M.attach(client, bufnr)
    __maps__(client, bufnr)
end

return M
