--[[
  A clean, dark Neovim theme written in Lu
  See: https://github.com/folke/tokyonight.nvim
]]

return {
  "folke/tokyonight.nvim",
  lazy = false,
  init = function()
    vim.cmd.colorscheme("tokyonight")
  end,
  priority = 1000,
  config = true,
}
