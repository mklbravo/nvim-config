--[[
  Entry point file for neovim
]]

-- Bootstrap Lazy Plugin Manager
require("lazy-bootstrap")

-- Settings
require("settings")
require("keymaps")

-- Initialize Plugin Manager
local lazySpec = { { import = "plugins" } }
local lazyConfig = { ui = { border = "rounded" } }

require("lazy").setup(lazySpec, lazyConfig)

-- Treesitter config (language list, parser install, highlight autocmd)
require("config.treesitter").setup()
