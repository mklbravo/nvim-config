--[[
  Displays a popup with possible keybindings of the command you started typing.
  See: https://github.com/folke/which-key.nvim
]]

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function(_, opts)
    local which_key = require("which-key")
    which_key.setup(opts)
    which_key.add(opts.spec)
  end,
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    spec = {
      { "<leader>b", group = "Buffer" },
      { "<leader>d", group = "Debug" },
      { "<leader>e", group = "Explorer" },
      { "<leader>p", group = "Project" },
      { "<leader>t", group = "Testing" },
      { "<leader>x", group = "Trouble" },
    },
    defaults = {},
  },
}
