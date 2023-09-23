--[[
  Entry point file for neovim
]]

-- Bootstrap Lazy Plugin Manager
require("lazy-bootstrap")

-- Settings
require("settings")
require("keybindings")

-- Initialize Plugin Manager
require("lazy").setup("plugins")

require("config")
