--[[
  A highly extendable fuzzy finder over lists
  See: https://github.com/nvim-telescope/telescope.nvim
]]

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "folke/trouble.nvim",
  },
  keys = function()
    local telescopeBuiltin = require("telescope.builtin")
    return {
      { "<leader>pb", telescopeBuiltin.buffers, mode = "n", desc = "[Telescope] Find files from open buffers" },
      { "<leader>pf", telescopeBuiltin.find_files, mode = "n", desc = "[Telescope] Find files in root folder" },
      { "<leader>po", telescopeBuiltin.oldfiles, mode = "n", desc = "[Telescope] Find files from old-files" },
      { "<leader>pr", telescopeBuiltin.git_files, mode = "n", desc = "[Telescope] Find files in repository" },
      { "<leader>ps", telescopeBuiltin.lsp_document_symbols, mode = "n", desc = "[Telescope] Find document symbols" },
      { "<leader>pt", telescopeBuiltin.live_grep, mode = "n", desc = "[Telescope] Find text in files" },
    }
  end,
  opts = function()
    local troubleTelescopeSource = require("trouble.sources.telescope")

    return {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
        },
        mappings = {
          i = {
            ["<C-t>"] = troubleTelescopeSource.open,
          },
          n = {
            ["<C-t>"] = troubleTelescopeSource.open,
          },
        },
      },
      pickers = {
        buffers = {
          ignore_current_buffer = true,
          sort_mru = true,
        },
      },
    }
  end,
  tag = "0.1.4",
}
