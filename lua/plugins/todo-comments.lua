--[[
  Highlight, list and search todo comments in your projects
  See: https://github.com/folke/todo-comments.nvim
]]

return {
  "folke/todo-comments.nvim",
  dependencies = {
    "folke/trouble.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {},
  keys = {
    {
      "<leader>xt",
      function()
        vim.api.nvim_command("TodoTrouble cwd=" .. vim.fn.expand("%"))
      end,
      mode = "n",
      desc = "[Trouble] Open file TODO list",
      silent = true,
    },
    {
      "<leader>pt",
      ":TodoTelescope<CR>",
      mode = "n",
      desc = "[Telescope] Find in TODO list",
      silent = true,
    },
  },
}
