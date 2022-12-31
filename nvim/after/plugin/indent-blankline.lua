vim.opt.termguicolors = true
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#1f1f1f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#b7b7b7 gui=nocombine]]
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
    },
    show_current_context = true,
    show_end_of_line = true,
    space_char_blankline = " ",
}
