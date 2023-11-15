--[[
  An asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support.
  See: https://github.com/mfussenegger/nvim-lint
]]

return {
  "mfussenegger/nvim-lint",
  lazy = false,
  config = function()
    local lint = require("lint")
    local linter_configs = require("languages").get_linter_configs()

    -- Initialize table
    lint.linters_by_ft = {}

    for filetype, config in pairs(linter_configs) do
      lint.linters_by_ft[filetype] = { config.linter }

      for option, value in pairs(config.opts) do
        lint.linters[config.linter][option] = value
      end
    end

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
