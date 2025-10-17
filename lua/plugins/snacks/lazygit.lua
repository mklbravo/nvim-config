--[[
  Automatically configures lazygit with a theme generated based on your Neovim colorscheme and integrate edit with the current neovim instance.
  See: https://github.com/folke/snacks.nvim/blob/main/docs/lazygit.md
]]

---@diagnostic disable: undefined-global
---@type SnacksConfig
return {
  opts = {
    enabled = true,
  },
  keys = {
    {
      "<leader>G",
      function()
        Snacks.lazygit.open()
      end,
      desc = "Open lazygit",
    },
    {
      "<leader>gf",
      function()
        Snacks.lazygit.log_file()
      end,
      desc = "Open lazygit log for current file",
    },
  },
}
