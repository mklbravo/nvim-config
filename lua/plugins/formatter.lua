--[[
  A format runner for Neovim
  See: https://github.com/mhartington/formatter.nvim
]]

return {
  "mhartington/formatter.nvim",
  lazy = false,
  config = function(_, opts)
    local formatter_configs = require("languages").get_formatter_configs()

    opts.filetype = {}

    for language, language_formatter_config in pairs(formatter_configs) do
      opts.filetype[language] = language_formatter_config
    end

    require("formatter").setup(opts)
  end,
  opts = {

  },
  keys = function()
    vim.api.nvim_create_autocmd("BufWritePost", { pattern = "*", command = "FormatWrite" })

    return {
      { "<leader>F", ":FormatWrite<CR>", mode = "n", desc = "Format document", silent = true },
    }
  end,
}
