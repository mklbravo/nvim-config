--[[
  A format runner for Neovim
  See: https://github.com/mhartington/formatter.nvim
]]
return {
  "mhartington/formatter.nvim",
  lazy = false,
  config = function()
    local opts = {

      filetype = {
        lua = {
          require("formatter.filetypes.lua").stylua,
        },
      },
    }

    require("formatter").setup(opts)
  end,
  keys = function()
    vim.api.nvim_create_autocmd("BufWritePost", { pattern = "*", command = ":FormatWrite<CR>" })

    return {
      { "<leader>F", ":FormatWrite<CR>", mode = "n", desc = "Format document", silent = true },
    }
  end,
}
