--[[
  Soothing pastel theme for (Neo)vim
  See: https://github.com/catppuccin/nvim
]]
return {
  "catppuccin/nvim",
  init = function()
    vim.cmd.colorscheme("catppuccin-macchiato")
  end,
  opts = {
    integrations = {
      gitsigns = true,
      neotree = true,
      notify = true,
      telescope = {
        enabled = true,
      },
    },
    term_colors = true,
  },
  lazy = false,
  name = "catppuccin",
  priority = 1000,
}
