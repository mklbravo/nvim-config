--[[
  Delete buffers without disrupting window layout.
  See: https://github.com/folke/snacks.nvim/blob/main/docs/bufdelete.md
]]
---@diagnostic disable: undefined-global
---@type SnacksConfig
return {
  keys = {
    {
      "<leader>bd",
      function()
        Snacks.bufdelete()
      end,
      desc = "Close current buffer",
    },
    {
      "<leader>ba",
      function()
        Snacks.bufdelete.all()
      end,
      desc = "Close all buffers",
    },
    {
      "<leader>bo",
      function()
        Snacks.bufdelete.other()
      end,
      desc = "Close all buffers except current",
    },
  },
}
