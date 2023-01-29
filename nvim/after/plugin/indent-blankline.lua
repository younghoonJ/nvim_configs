vim.opt.termguicolors = true
vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
    },
    space_char_highlight_list={
        "IndentBlanklineIndent1",
    },
    show_current_context = true,
    show_end_of_line = true,
}
