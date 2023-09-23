--[[
  Portable package manager. Easily install and manage LSP servers, DAP servers, linters, and formatters.
  See: https://github.com/williamboman/mason.nvim
]]

return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function(_, opts)
    require("mason").setup(opts)

    require("mason-tool-installer").setup({
      ensure_installed = {
        "stylua"
      },
      run_on_start = true,
    })
  end,
}
