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
        require("neotest-phpunit"),
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

      -- { "n", "<leader>tt", ":TestNearest<CR>", { noremap = true, silent = true } },
      -- { "n", "<leader>tf", ":TestFile<CR>", { noremap = true, silent = true } },
      -- { "n", "<leader>ts", ":TestSuite<CR>", { noremap = true, silent = true } },
      -- { "n", "<leader>tl", ":TestLast<CR>", { noremap = true, silent = true } },
      -- { "n", "<leader>tv", ":TestVisit<CR>", { noremap = true, silent = true } },
      -- { "n", "<leader>tg", ":TestNearest<CR>", { noremap = true, silent = true } },
      -- { "n", "<leader>tc", ":TestClear<CR>", { noremap = true, silent = true } },
      -- { "n", "<leader>tp", ":TestPrompt<CR>", { noremap = true, silent = true } },
      -- { "n", "<leader>ta", ":TestSuite<CR>", { noremap = true, silent = true } },
      -- { "n", "<leader>td", ":TestDrop<CR>", { noremap = true, silent = true } },
      -- { "n", "<leader>tr", ":TestRepeat<CR>", { noremap = true, silent = true } },
      -- { "n", "<leader>tn", ":TestNearest<CR>", { noremap = true, silent = true } },
      -- { "n", "<leader>tt", ":TestNearest<CR>", { noremap = true, silent = true } },
      -- { "n", "<leader>tf", ":TestFile<CR>", { noremap = true, silent = true } },
      -- { "n", "<leader>ts", ":TestSuite<CR>", { noremap = true, silent = true } },
      -- { "n", "<leader>tl", ":TestLast<CR>", { noremap = true, silent = true } },
      -- { "n", "<leader>tv", ":TestVisit<CR>", { noremap = true, silent = true } },
    }
  end,
}
