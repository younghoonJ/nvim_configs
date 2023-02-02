local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    return
end


vim.g.loaded = 1
vim.g.loaded_newrwPlugin = 1


local function open_nvim_tree(data)

    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
        return
    end

    -- create a new, empty buffer
    vim.cmd.enew()

    -- wipe the directory buffer
    vim.cmd.bw(data.buf)

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })



-- vim.cmd([[highlight NvimTreeIndentMarker guifg=#3FC5FF]])


nvimtree.setup({
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
})



--nvim tree
vim.keymap.set("n", "<A-1>", ":NvimTreeToggle<CR>")
