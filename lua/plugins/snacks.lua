--[[
  A collection of QoL plugins for Neovim
  See: https://github.com/folke/snacks.nvim
]]
---@diagnostic disable: undefined-global

---@class SnacksConfig
---@field opts? table
---@field keys? table

local bufdelete_config = require("plugins.snacks.bufdelete")
local lazygit_config = require("plugins.snacks.lazygit")
local scroll_config = require("plugins.snacks.scroll")

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
    lazygit = lazygit_config.opts,
    scroll = scroll_config.opts,
  },
  keys = merge_tables(bufdelete_config.keys, lazygit_config.keys),
}
