--[[
  Promt to generate conventional commit messages based on git diff
]]

return {
  name = "Commit Changes",
  config = {
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
}
