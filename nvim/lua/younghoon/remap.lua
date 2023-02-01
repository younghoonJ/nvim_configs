vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex,  { desc = "exit to the file explorer" })

vim.keymap.set("v", "J", ":m '>+1<CR>yv=gv",  { desc = "move visual block" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv",  { desc = "move visual block" })

vim.keymap.set("n", "<C-j>", "<C-d>zz",  { desc = "half page jumping" })
vim.keymap.set("n", "<C-k>", "<C-u>zz", { desc = "half page jumping" })

-- keep cursor center when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to the system clipboard" })



vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "[S]plit window [V]ertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "[S]plit window [H]orizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "[S]plit windows [E]qual width" })
vim.keymap.set("n", "<leader>sc", ":close<CR>", { desc = "[S]plit window [C]lose" })


vim.keymap.set("n", "<leader>to", ":tabnew<CR>", {desc = "[T]ab [O]pen"})
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", {desc = "[T]ab [C]lose"})
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", {desc = "[T]ab [N]ext"})
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", {desc = "[T]ab [P]rev"})
vim.keymap.set("n", "<C-t>", ":tabn<CR>", {desc = "[T]ab [N]ext"})


