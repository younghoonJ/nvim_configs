local servers = { "pyright", "rust_analyzer", "clangd", "cmake", "sumneko_lua" }


local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	require("younghoon.keymap").attach(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
		require("nvim-navic").attach(client, bufnr)
    end
end


-- @see https://github.com/wookayin/dotfiles/blob/master/nvim/lua/config/lsp.lua
do
    -- :help lsp-method
    -- :help lsp-handler
    -- :help lsp-handler-configuration
    local lsp_handlers_hover = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "single",
    })
    vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
        local bufnr, winnr = lsp_handlers_hover(err, result, ctx, config)
        if winnr ~= nil then
            -- opacity/alpha for hover window
            vim.api.nvim_win_set_option(winnr, "winblend", 30)
        end
        return bufnr, winnr
    end
end

do
    vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", })
    vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", })
    vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", })
    vim.fn.sign_define("DiagnosticSignHint", { text = "ﴞ", texthl = "DiagnosticSignHint", })
    -- vim.fn.sign_define("DiagnosticSignError",  {text = "✘", texthl = "DiagnosticSignError"})
    -- vim.fn.sign_define("DiagnosticSignWarn",   {text = "", texthl = "DiagnosticSignWarn"})
    -- vim.fn.sign_define("DiagnosticSignInfo",   {text = "i", texthl = "DiagnosticSignInfo"})
    -- vim.fn.sign_define("DiagnosticSignHint",   {text = "", texthl = "DiagnosticSignHint"})
    vim.cmd([[
        hi DiagnosticSignError    guifg=#e6645f ctermfg=167
        hi DiagnosticSignWarn     guifg=#b1b14d ctermfg=143
        hi DiagnosticSignHint     guifg=#3e6e9e ctermfg=75
        ]])
end

if vim.diagnostic then
    -- Customize how to show diagnostics:
    -- @see https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
    -- @see https://github.com/neovim/neovim/pull/16057 for new APIs
    vim.diagnostic.config({
        -- No virtual text (distracting!), show popup window on hover.
        virtual_text = false,
        signs = true,
        underline = {
            -- Do not underline text when severity is low (INFO or HINT).
            severity = {
                min = vim.diagnostic.severity.WARN,
            },
        },
        float = {
            source = "always",
            focusable = true,
            focus = false,
            border = "single",

            -- Customize how diagnostic message will be shown: show error code.
            format = function(diagnostic)
                -- See null-ls.nvim#632, neovim#17222 for how to pick up `code`
                local user_data
                user_data = diagnostic.user_data or {}
                user_data = user_data.lsp or user_data.null_ls or user_data
                -- TODO: symbol is specific to pylint (will be removed)
                local code = (diagnostic.symbol or diagnostic.code or user_data.symbol or user_data.code)
                if code then
                    return string.format("%s (%s)", diagnostic.message, code)
                else
                    return diagnostic.message
                end
            end,
        },
    })
    LspDiagnosticsShowPopup = function()
        return vim.diagnostic.open_float(0, {
            scope = "cursor",
        })
    end
end

-- Show diagnostics in a pop-up window on hover
do
    LspDiagnosticsPopupHandler = function()
        local current_cursor = vim.api.nvim_win_get_cursor(0)
        local last_popup_cursor = vim.w.lsp_diagnostics_last_cursor or { nil, nil }

        -- Show the popup diagnostics window,
        -- but only once for the current cursor location (unless moved afterwards).
        if not (current_cursor[1] == last_popup_cursor[1] and current_cursor[2] == last_popup_cursor[2]) then
            vim.w.lsp_diagnostics_last_cursor = current_cursor
            local _, winnr = LspDiagnosticsShowPopup()
            if winnr ~= nil then
                -- opacity/alpha for diagnostics
                vim.api.nvim_win_set_option(winnr, "winblend", 30)
            end
        end
    end
    vim.cmd([[
        augroup LSPDiagnosticsOnHover
        autocmd!
        autocmd CursorHold *   lua LspDiagnosticsPopupHandler()
        augroup END
        ]])
end



-- nice-reference

require("nice-reference").setup({
    anchor = "NW", -- Popup position anchor
    relative = "cursor", -- Popup relative position
    row = 1, -- Popup x position
    col = 0, -- Popup y position
    border = "rounded", -- Popup borderstyle
    winblend = 0, -- Popup transaparency 0-100, where 100 is transparent
    max_width = 120, -- Max width of the popup
    max_height = 10, -- Max height of the popup
    auto_choose = false, -- Go to reference if there is only one
})


-- nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()



for _, lsp in pairs(servers) do
    require("lspconfig")[lsp].setup({
        on_attach = on_attach,
        flags = {
            -- This is the default in Nvim 0.7+
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    })
end

vim.o.timeout = true
vim.o.timeoutlen = 300