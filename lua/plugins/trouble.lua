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
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = function()
    local trouble = require("trouble")

    return {
      {
        "<leader>xx",
        function()
          trouble.toggle()
        end,
        mode = "n",
        desc = "[Trouble] Toggle panel",
      },
      {
        "<leader>xw",
        function()
          trouble.toggle("workspace_diagnostics")
        end,
        mode = "n",
        desc = "[Trouble] Toggle workspace diagnostics",
      },
      {
        "<leader>xd",
        function()
          trouble.toggle("document_diagnostics")
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
