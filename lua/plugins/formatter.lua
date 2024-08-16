--[[
  A format runner for Neovim
  See: https://github.com/mhartington/formatter.nvim
]]

return {
  "mhartington/formatter.nvim",
  lazy = false,
  config = true,
  keys = function()
    vim.api.nvim_create_autocmd("BufWritePost", { pattern = "*", command = "FormatWrite" })

    return {
      { "<leader>F", ":FormatWrite<CR>", mode = "n", desc = "Format document", silent = true },
    }
  end,
}
