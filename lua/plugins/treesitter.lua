--[[
  Treesitter configurations and abstraction layer for Neovim.
  See: https://github.com/nvim-treesitter/nvim-treesitter
]]

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
  opts = {
    additional_vim_regex_highlighting = false,
    auto_install = true,
    ensure_installed = {
      "lua",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    sync_install = false,
  },
}
