--[[
  Edit and review GitHub issues and pull requests from the comfort of your favorite editor
  See: https://github.com/pwntester/octo.nvim
]]

return {
  "pwntester/octo.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    -- OR 'ibhagwan/fzf-lua',
    "nvim-tree/nvim-web-devicons",
  },
  opts = {},
  keys = {
    {
      "<leader>mm",
      ":Octo pr create<CR>",
      mode = "n",
      desc = "Create pull request",
      silent = true,
    },
  },
}
