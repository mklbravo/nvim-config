--[[
  A collection of QoL plugins for Neovim
  See: https://github.com/folke/snacks.nvim
]]
---@diagnostic disable: undefined-global
-- Buffer key mappings
local buffer_keys = {
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
}

-- Lazygit key mappings
local lazygit_keys = {
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
}

return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    lazygit = { enabled = true },
    scroll = { enabled = true },
  },
  keys = vim.tbl_extend("force", buffer_keys, lazygit_keys),
}
