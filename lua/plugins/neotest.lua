--[[
  An extensible framework for interacting with tests within NeoVim.
  See: https://github.com/nvim-neotest/neotest
]]

return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "olimorris/neotest-phpunit",
  },
  opts = true,
  config = function()
    require("neotest").setup({
      adapters = {
        -- Move this to language specific config
        require("neotest-phpunit")({
          env = {
            APP_ENV = "test",
            XDEBUG_MODE = "off",
          },
          root_files = { "composer.json" },
        }),
      },
    })
  end,
  keys = function()
    local neotest = require("neotest")
    return {
      {
        "<leader>tt",
        function()
          neotest.run.run()
        end,
        mode = "n",
        desc = "Run nearest test",
        silent = true,
      },
      {
        "<leader>tf",
        function()
          neotest.run.run(vim.fn.expand("%"))
        end,
        mode = "n",
        desc = "Test current file",
        silent = true,
      },
      {
        "<leader>ta",
        function()
          neotest.run.run({ suite = true })
        end,
        mode = "n",
        desc = "Test current file",
        silent = true,
      },
      {
        "<leader>ts",
        function()
          neotest.summary.toggle()
        end,
        mode = "n",
        desc = "Toggle test summary",
        silent = true,
      },
      {
        "<leader>to",
        function()
          neotest.output.open()
        end,
        mode = "n",
        desc = "Show test output",
        silent = true,
      },
    }
  end,
}
