return {
  filetype = "typescript",
  formatter = {
    package = "prettier",
    opts = function()
      return require("formatter.filetypes.typescript").prettier()
    end,
  },
}
