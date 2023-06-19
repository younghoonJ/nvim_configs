function apply(color)
    vim.opt.termguicolors=true
    ayucolor = "dark"
    color = color or "kanagawa"
    -- color = color or "Duskfox"
    -- color = color or "tokyonight"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

apply()

local set = vim.opt


function apply_cappuccin()
  set.termguicolors = true
  set.background = "dark"

  -- Settings for catppuccin
  require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
      light = "latte",
      dark = "mocha",
    },
    transparent_background = false,
    term_colors = false,
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
      -- bufferline = true,
      cmp = true,
      gitsigns = true,
      telescope = true,
        notify = false, -- TODO: ?
        mini = false, -- TODO: ?
      lsp_saga = true,
        markdown = true,
        mason = true,
        neotree = true,
        neogit = true,
        neotest = true, -- TODO: ?
        dap = {
          enabled = true,
          enable_ui = true, -- enable nvim-dap-ui
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        treesitter = true,
        lsp_trouble = true,
        which_key = true,
    },
  })

  -- setup must be called before loading
  vim.cmd.colorscheme("catppuccin")
end

 -- apply_cappuccin()
 
 apply()

