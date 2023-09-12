--[[
]]

return {
  "Mofiqul/dracula.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  init = function() 
    -- Set colorscheme on plugin init
    vim.cmd.colorscheme("dracula")
  end
}

