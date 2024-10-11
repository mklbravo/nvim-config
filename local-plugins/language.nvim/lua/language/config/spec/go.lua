return {
  filetype = "go",
  lsp = {
    package = "gopls",
  },
  formatter = {
    package = "goimports",
    opts = function()
      return require("formatter.filetypes.go").goimports()
    end,
  },
}
