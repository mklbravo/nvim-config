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
               1. Please get current directory with `git diff -B -M -C`.
               2. Also get the list of new, modified, and deleted files using `git status --porcelain`.
               3. Read and analyze the git diff and status output to understand the changes made.
               4. Read new or modified files if necessary to get context about the changes.
               5. Decide if the changes needs to be commites in a single commit or multiple commits.
               6. If multiple commits are needed, break down the changes accordingly and generate separate commit messages for each.
               7. For each required commit, follow these steps:
                 1. Analyze and determine the type of change (feat, fix, docs, style, refactor, test, chore).
                 2. Based on your analysis, generate a Conventional Commit message that accurately describes the changes made.
                 3. Ensure the commit message follows the Conventional Commits format: <type>(<scope>): <description>.
                 4. Make sure the description is concise and informative.
                 5. Provide the commit message and description as the output, with  additional explanation if necessary.
                 6. Stage the relevant changes for this commit.
                 7. Commit the changes using the generated conventional commit message and commit description.

              ### Tools you can use:
                - @{cmd_runner}: A tool that allows you to run shell commands. Use this to get the git diff and to stage and commit changes.
                - @{file_reader}: A tool that allows you to read file contents. Use this to read new or modified files for context.

              ### Variables you have access to:
                - #{mcp:neovim://workspace}: Gives comprenhensive information about the current workspace, including file paths and contents.
              ]],
      },
    },
  },
}
