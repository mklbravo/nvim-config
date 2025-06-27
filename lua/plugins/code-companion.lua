-- CodeCompanion plugin configuration
return {
  "olimorris/codecompanion.nvim",
  opts = {
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          icon = "",
        })
      end,
    },
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          show_result_in_chat = true, -- Show mcp tool results in chat
          make_vars = true, -- Convert resources to #variables
          make_slash_commands = true, -- Add prompts as /slash commands
        },
      },
    },
    strategies = {
      chat = {
        roles = {
          user = " Shōgun",
          llm = function(adapter)
            local icon = adapter.icon or ""
            return string.format(" MAIk: %s %s | %s", icon, adapter.formatted_name, adapter.model.name)
          end,
        },
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
  },
  lazy = false,
  keys = {
    {
      "<leader>ac",
      "<cmd>CodeCompanionChat Toggle<cr>",
      desc = "Toggle CodeCompanion chat",
    },
    {
      "<leader>ai",
      "<cmd>CodeCompanion<cr>",
      desc = "Inline CodeCompanion",
    },
    {
      "<leader>aa",
      "<cmd>CodeCompanionActions<cr>",
      desc = "Show CodeCompanion actions",
    },
  },
}
