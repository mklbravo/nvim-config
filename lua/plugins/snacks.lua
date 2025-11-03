--[[
  A collection of QoL plugins for Neovim
  See: https://github.com/folke/snacks.nvim
]]
---@diagnostic disable: undefined-global

---@class SnacksConfig
---@field opts? table
---@field keys? table

local bufdelete_config = require("plugins.snacks.bufdelete")
local dashboard_config = require("plugins.snacks.dashboard")
local gh_config = require("plugins.snacks.gh")
local indent_config = require("plugins.snacks.indent")
local lazygit_config = require("plugins.snacks.lazygit")
local picker_config = require("plugins.snacks.picker")
local scroll_config = require("plugins.snacks.scroll")

-- ------------------------------------------------------------------------
-- Helper Functions
-- ------------------------------------------------------------------------
local function merge_tables(...)
  local result = {}
  for _, tbl in ipairs({ ... }) do
    for _, value in pairs(tbl) do
      table.insert(result, value)
    end
  end
  return result
end

-- ------------------------------------------------------------------------
-- Lazy configuration
-- ------------------------------------------------------------------------
return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    dashboard = dashboard_config.opts,
    lazygit = lazygit_config.opts,
    scroll = scroll_config.opts,
    indent = indent_config.opts,
    gh = gh_config.opts,
    picker = picker_config.opts,
  },
  keys = merge_tables(bufdelete_config.keys, lazygit_config.keys, picker_config.keys),
}
