--[[
  Plugin to browse the file system and other tree like structures in whatever style suits you:w
  See: https://github.com/nvim-neo-tree/neo-tree.nvim
]]

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree", -- Lazy-load on event
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  },
  keys = {
    {
      "<leader>fe",
      function()
        require("neo-tree.command").execute({ focus = true, dir = vim.loop.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
  },
  opt = {
    enable_diagnostics = true,
    enable_git_status = true,
  },
}
