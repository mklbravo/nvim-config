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
  keys = function()
    local neo_tree_command = require("neo-tree.command")
    return {
      {
        "<leader>E",
        function()
          neo_tree_command.execute({
            source = "last",
            toggle = true,
          })
        end,
        desc = "Show hidde explorer",
      },
      {
        "<leader>ef",
        function()
          neo_tree_command.execute({
            action = "focus",
            dir = vim.loop.cwd(),
            source = "filesystem",
          })
        end,
        desc = "Explore filesystem",
      },
      {
        "<leader>eb",
        function()
          neo_tree_command.execute({
            action = "focus",
            source = "buffers",
          })
        end,
        desc = "Explore open buffers",
      },
      {
        "<leader>eg",
        function()
          neo_tree_command.execute({
            action = "focus",
            source = "git_status",
          })
        end,
        desc = "Explore git status",
      },
      {
        "<leader>es",
        function()
          neo_tree_command.execute({
            action = "focus",
            source = "document_symbols",
          })
        end,
        desc = "Explore symbols",
      },
    }
  end,
  opts = {
    auto_clean_after_session_restore = true, -- Automatically clean up broken neo-tree buffers saved in sessions
    close_if_last_window = true,
    enable_diagnostics = true,
    enable_git_status = true,
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
      filtered_items = {
        never_show = {
          ".git",
        },
        hide_dotfiles = false,
      },
    },
    sources = {
      "buffers",
      "document_symbols",
      "filesystem",
      "git_status",
    },
    source_selector = {
      content_layout = "center",
      sources = {
        { source = "filesystem", display_name = " File" },
        { source = "buffers", display_name = " 󰈙 Bufs" },
        { source = "git_status", display_name = "󰊢 Git" },
        { source = "document_symbols", display_name = " Symbols" },
      },
      winbar = true,
    },
  },
}
