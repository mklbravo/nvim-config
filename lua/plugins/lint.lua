--[[
  An asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support.
  See: https://github.com/mfussenegger/nvim-lint
]]

return {
  "mfussenegger/nvim-lint",
  lazy = false,
  config = function()
    local lint = require("lint")

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
