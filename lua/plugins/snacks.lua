--[[
  A collection of QoL plugins for Neovim
  See: https://github.com/folke/snacks.nvim
]]
---@diagnostic disable: undefined-global
return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    lazygit = { enabled = true },
    scroll = { enabled = true },
  },
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
    {
      "<leader>G",
      function()
        Snacks.lazygit.open()
      end,
      desc = "Open lazygit",
    },
    {
      "<leader>gf",
      function()
        Snacks.lazygit.log_file()
      end,
      desc = "Open lazygit log for current file",
    },
  },
}
