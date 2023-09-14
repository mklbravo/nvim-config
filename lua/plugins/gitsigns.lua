--[[
  Super fast git decorations implemented purely in Lua.
  See: https://github.com/lewis6991/gitsigns.nvim
]]

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    current_line_blame = true,
    numhl = true,
    signcolumn = true, 
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
  },
}
