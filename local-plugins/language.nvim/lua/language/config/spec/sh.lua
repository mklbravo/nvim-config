return {
  filetype = "sh",
  formatter = {
    package = "shfmt",
    opts = function()
      return require("formatter.filetypes.sh").shfmt()
    end,
  },
  linter = {
    package = "shellcheck",
    opts = {},
  },
}
