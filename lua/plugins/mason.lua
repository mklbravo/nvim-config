--[[
  Portable package manager. Easily install and manage LSP servers, DAP servers, linters, and formatters.
  See: https://github.com/williamboman/mason.nvim
  See: https://github.com/williamboman/mason-lspconfig.nvim
]]

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function(_, opts)
    require("mason").setup(opts)
    require("mason-lspconfig").setup({})
  end,
  opts = true,
}
