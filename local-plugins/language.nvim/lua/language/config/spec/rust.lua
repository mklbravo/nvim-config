return {
  filetype = "rust",
  lsp = {
    package = "rust_analyzer",
    opts = {},
  },
  formatter = {
    --[[
      Installing rustfmt through mason is deprecated,
      It must be installed through rustup
    ]]
    opts = function()
      return require("formatter.filetypes.rust").rustfmt()
    end,
  },
}
