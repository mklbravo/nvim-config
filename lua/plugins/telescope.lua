--[[
  A highly extendable fuzzy finder over lists
  See: https://github.com/nvim-telescope/telescope.nvim
]]

return {
  "nvim-telescope/telescope.nvim",
  keys = function()
    local telescopeBuiltin = require("telescope.builtin")
    return {
      { "<C-p>", telescopeBuiltin.git_files, mode = "n", desc = "Find files (git)" },
      { "<leader>pb", telescopeBuiltin.buffers, mode = "n", desc = "[Telescope] Find open buffers" },
      { "<leader>pf", telescopeBuiltin.find_files, mode = "n", desc = "[Telescope] Find files (root)" },
      { "<leader>pr", telescopeBuiltin.oldfiles, mode = "n", desc = "[Telescope] Find old files" },
      { "<leader>ps", telescopeBuiltin.live_grep, mode = "n", desc = "[Telescope] Find in Files" },
    }
  end,
  opts = {
    defaults = {
      file_ignore_patterns = {
        "node_modules",
      },
    },
  },
  tag = "0.1.4",
}
