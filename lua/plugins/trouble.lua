--[[
  A pretty list for showing diagnostics, references, telescope results, quickfix and location.
  See: https://github.com/folke/trouble.nvim
]]

return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    modes = {
      buffer_diagnostics = {
        mode = "diagnostics",
        filter = { buf = 0 },
      },
    },
  },
  keys = function()
    local trouble = require("trouble")

    local a = 1
    return {
      {
        "<leader>xw",
        function()
          trouble.focus("diagnostics")
        end,
        mode = "n",
        desc = "[Trouble] Toggle workspace diagnostics",
      },
      {
        "<leader>xb",
        function()
          trouble.focus("buffer_diagnostics")
        end,
        mode = "n",
        desc = "[Trouble] Toggle document diagnostics",
      },
      {
        "<leader>xq",
        function()
          trouble.toggle("quickfix")
        end,
        mode = "n",
        desc = "[Trouble] Toggle quickfix",
      },
      {
        "<leader>xl",
        function()
          trouble.toggle("loclist")
        end,
        mode = "n",
        desc = "[Trouble] Toggle loclist",
      },
      {
        "gR",
        function()
          trouble.toggle("lsp_references")
        end,
        mode = "n",
        desc = "[Trouble] Toggle LSP references",
      },
    }
  end,
}
