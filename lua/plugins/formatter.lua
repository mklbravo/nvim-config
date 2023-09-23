--[[
  A format runner for Neovim
  See: https://github.com/mhartington/formatter.nvim
]]
return {
  "mhartington/formatter.nvim",
  config = function()
  end,
  keys = {
    { "<leader>F", ":Format<CR>", mode = "n", desc = "Format document", silent = true },
  },
}
