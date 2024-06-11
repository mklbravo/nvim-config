return {
  filetype = "lua",
  lsp = {
    package = "lua_ls",
    opts = {},
  },
  formatter = {
    package = "stylua",
    opts = function()
      return require("formatter.filetypes.lua").stylua()
    end,
  },
}
