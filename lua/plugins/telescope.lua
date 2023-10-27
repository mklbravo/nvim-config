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
      { "<leader>pf", telescopeBuiltin.find_files, mode = "n", desc = "[Telescope] Find files (root)" },
      { "<leader>ps", telescopeBuiltin.live_grep, mode = "n", desc = "[Telescope] Find IN Files" },
      { "<leader>pr", telescopeBuiltin.oldfiles, mode = "n", desc = "[Telescope] Old files" },
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
