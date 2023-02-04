
local colors = require("younghoon.colors")

require("scrollbar").setup({
    handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = false, -- Requires gitsigns
        handle = true,
        search = false, -- Requires hlslens
        ale = false, -- Requires ALE
    },
    marks = {
        Cursor = {
            -- text = "◾",
            text= "▬",
            priority = 0,
            gui=nil,
            color = colors.cursor,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "Normal",
        },
        Search = {
            text = { "-", "=" },
            priority = 1,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "Search",
        },
        Error = {
            text = { "-", "=" },
            priority = 2,
            gui=nil,
            color = colors.red,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextError",
        },
        Warn = {
            text = { "-", "=" },
            priority = 3,
            gui=nil,
            color =  colors.orange,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextWarn",
        },
        Info = {
            text = { "-", "=" },
            priority = 4,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextInfo",
        },
        Hint = {
            text = { "-", "=" },
            priority = 5,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextHint",
        },
    }
})