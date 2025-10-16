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

-- Functions
local function merge_tables(...)
  local result = {}
  for _, tbl in ipairs({ ... }) do
    for _, value in pairs(tbl) do
      table.insert(result, value)
    end
  end
  return result
end

return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    lazygit = { enabled = true },
    scroll = { enabled = true },
  },
  keys = merge_tables(buffer_keys, lazygit_keys),
}
