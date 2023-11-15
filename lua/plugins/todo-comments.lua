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
      ":TodoTrouble<CR>",
      mode = "n",
      desc = "[Trouble] Open todo list",
      silent = true,
    },
    {
      "<leader>pt",
      ":TodoTelescope<CR>",
      mode = "n",
      desc = "[Telescope] Find in todo list",
      silent = true,
    },
  },
}
