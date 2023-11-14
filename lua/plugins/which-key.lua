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
    which_key.register(opts.defaults)
  end,
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    defaults = {
      mode = { "n", "v" },
      ["<leader>b"] = { name = "+buffer" },
      ["<leader>e"] = { name = "+explorer" },
      ["<leader>p"] = { name = "+project" },
      ["<leader>x"] = { name = "+trouble" },
    },
  },
}
