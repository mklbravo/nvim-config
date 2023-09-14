--[[
  Dracula colorscheme for neovim written in Lua   
  See: https://github.com/Mofiqul/dracula.nvim
]]

return {
  "Mofiqul/dracula.nvim",
  init = function() 
    -- Set colorscheme on plugin init
    vim.cmd.colorscheme("dracula")
  end,
  lazy = false,
  opts = {
    colors = {
      bg = "#22212C",
      comment = "#7970A9",
      cyan = "#80FFEA",
      fg = "#F8F8F2",
      green = "#8AFF80",
      orange = "#FFCA80",
      pink = "#FF80BF",
      purple = "#9580FF",
      red = "#FF9580",
      selection = "#454158",
      yellow = "#FFFF80",
    },
  },
  priority = 1000,
}

