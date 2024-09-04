return {
  filetype = "yaml",
  linter = {
    package = "yamllint",
  },
  formatter = {
    package = "yamlfmt",
    opts = function()
      -- See: https://github.com/mhartington/formatter.nvim/blob/master/lua/formatter/filetypes/yaml.lua
      return require("formatter.filetypes.yaml").yamlfmt()
    end,
  },
}
