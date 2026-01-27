--[[
  This prompt is designed to help an AI assistant generate Conventional Commit messages
  based on the changes made in a git repository. The assistant will analyze the git diff
  and status, read relevant files for context, and create appropriate commit messages
  following the Conventional Commits specification.
]]

return {
  name = "Commit Changes",
  config = {
    strategy = "chat",
    description = "Analyze git changes and commit them with Conventional Commit messages",
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
               1. Use @{git__git_diff} and @{git__git_status} to get the git diff of the current changes in the repository.
               2. Read new or modified files if necessary to get context about the changes.
               3. Decide if the changes needs to be commites in a single commit or multiple commits.
               4. If multiple commits are needed, break down the changes accordingly and generate separate commit messages for each.
               5. For each required commit, follow these steps:
                 1. Analyze and determine the type of change (feat, fix, docs, style, refactor, test, chore).
                 2. Based on your analysis, generate a Conventional Commit message that accurately describes the changes made.
                 3. Ensure the commit message follows the Conventional Commits format: <type>(<scope>): <description>.
                 4. Make sure the description is concise and informative.
                 5. Provide the commit message and description as the output, with  additional explanation if necessary.
                 6. Stage the relevant changes for this commit using @{git__git_add}.
                 7. Commit the changes using the @{git__git_commit} generated conventional commit message and commit description.

              ### Tools you can use:
                - @{file_reader}: A tool that allows you to read file contents. Use this to read new or modified files for context.

              ### Variables you have access to:
                - #{mcp:neovim://workspace}: Gives comprenhensive information about the current workspace, including file paths and contents.

              NOTE: First analyze the changes and wait for my confirmation before proceeding to commit the changes.
              ]],
      },
    },
  },
}
