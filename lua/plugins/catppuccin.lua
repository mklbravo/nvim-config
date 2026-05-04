--[[
  Soothing pastel theme for (Neo)vim
  See: https://github.com/catppuccin/nvim
]]
return {
  "catppuccin/nvim",
  init = function()
    vim.cmd.colorscheme("catppuccin-nvim")
  end,
  opts = {
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    integrations = {
      dap = true,
      dap_ui = true,
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
