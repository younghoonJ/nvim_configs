-- @see: https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/after/plugin/completion.lua
local status, cmp = pcall(require, 'cmp')
if not status then
    return
end

vim.opt.completeopt = {"menu", "menuone", "noselect"}
-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item {
            behavior = cmp.SelectBehavior.Insert
        },
        ["<C-j>"] = cmp.mapping.select_next_item {
            behavior = cmp.SelectBehavior.Insert
        },
        ["<C-k>"] = cmp.mapping.select_prev_item {
            behavior = cmp.SelectBehavior.Insert
        },
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
         -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({ select = true})
    }),
    sources = {
        {name = "nvim_lsp" },
        {name = 'luasnip'},
        {name = 'buffer'}
        },
    formatting = {
        format = require('lspkind').cmp_format({
            mode = 'symbol_text',
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function (entry, vim_item)
              return vim_item
            end
          })
    }
})
