return {
  filetype = "vue",
  formatter = {
    package = "prettier",
    opts = function()
      return require("formatter.filetypes.vue").prettier()
    end,
  },
  lsp = {
    package = "vue_ls",
  },
}
