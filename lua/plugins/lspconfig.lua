--[[
  Quickstart configs for Nvim LSP
  See: https://github.com/neovim/nvim-lspconfig
]]

return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspConfig = require("lspconfig")
    lspConfig.lua_ls.setup({})
  end,
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  keys = function()
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    ()
    return {
    }
  end,
}
