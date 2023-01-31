if pcall(require, 'fidget') then
  -- https://github.com/j-hui/fidget.nvim/blob/main/doc/fidget.md
  require("fidget").setup {
    text = {
      --see ~/.vim/plugged/fidget.nvim/lua/fidget/spinners.lua
      spinner = "zip",
    },
    window = {
      relative = "win",
      blend = 50,
    },
  }
end
