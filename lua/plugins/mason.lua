--[[
  Portable package manager. Easily install and manage LSP servers, DAP servers, linters, and formatters.
  See: https://github.com/williamboman/mason.nvim
  See: https://github.com/williamboman/mason-lspconfig.nvim
]]

return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function(_, opts)
    require("mason").setup(opts)

    require("mason-tool-installer").setup({
      ensure_installed = {
        -- LSP,
        "lua-language-server",
        -- Formatters
        "stylua",
      },
      run_on_start = true,
    })

    require("mason-lspconfig").setup({})
  end,
  opts = true,
}
