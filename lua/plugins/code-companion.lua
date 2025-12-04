-- CodeCompanion plugin configuration
return {
  "olimorris/codecompanion.nvim",
  init = function()
    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd([[cab cc CodeCompanion]])
  end,
  opts = function()
    local prompt_commit_changes = require("plugins.code-companion.prompt-commit-changes")
    local prompt_code_review = require("plugins.code-companion.prompt-code-review")
    return {
      adapters = {
        http = {
          copilot = function()
            return require("codecompanion.adapters").extend("copilot", {
              icon = "",
            })
          end,
        },
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
      prompt_library = {
        [prompt_commit_changes.name] = prompt_commit_changes.config,
        [prompt_code_review.name] = prompt_code_review.config,
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
    }
  end,
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
      mode = { "n", "v" },
      noremap = true,
      silent = true,
    },
    {
      "<leader>ai",
      "<cmd>CodeCompanion<cr>",
      desc = "Inline CodeCompanion",
      mode = { "n", "v" },
      noremap = true,
      silent = true,
    },
    {
      "<leader>aa",
      "<cmd>CodeCompanionActions<cr>",
      desc = "Show CodeCompanion actions",
      mode = { "n", "v" },
      noremap = true,
      silent = true,
    },
    {
      "ga",
      "<cmd>CodeCompanionChat Add<cr>",
      mode = "v",
      noremap = true,
      silent = true,
      desc = "Add visual selection to CodeCompanion chat",
    },
  },
}
