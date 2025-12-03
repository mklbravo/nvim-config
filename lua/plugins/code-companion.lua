-- CodeCompanion plugin configuration
return {
  "olimorris/codecompanion.nvim",
  init = function()
    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd([[cab cc CodeCompanion]])
  end,
  opts = {
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
      ["Commit Changes"] = {
        strategy = "chat",
        description = "Test promt on CdeCompanion chat",
        opts = {
          auto_submit = true,
        },
        prompts = {
          {
            role = "system",
            content = "You are a git expert assistant that follows the Conventional Commits specification.",
          },
          {
            role = "user",
            content = [[
              ### Steps to follow:
               1. Please get current directory git diff.
               2. Decide if the changes needs to be commites in a single commit or multiple commits.
               3. If multiple commits are needed, break down the changes accordingly and generate separate commit messages for each.
               4. For each required commit, follow these steps:
                 1. Analyze and determine the type of change (feat, fix, docs, style, refactor, test, chore).
                 2. Based on your analysis, generate a Conventional Commit message that accurately describes the changes made.
                 3. Ensure the commit message follows the Conventional Commits format: <type>(<scope>): <description>.
                 4. Make sure the description is concise and informative.
                 5. Provide the commit message and description as the output, with  additional explanation if necessary.
                 6. Stage the relevant changes for this commit.
                 7. Commit the changes using the generated conventional commit message and commit description.

              ### Tools you can use:
                - @{cmd_runner}: A tool that allows you to run shell commands. Use this to get the git diff and to stage and commit changes.
              ]],
          },
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
