--[[
  This prompt is designed to help an AI assistant generate Conventional Commit messages
  based on the changes made in a git repository. The assistant will analyze the git diff
  and status, read relevant files for context, and create appropriate commit messages
  following the Conventional Commits specification.
]]

return {
  name = "Review Code",
  config = {
    strategy = "chat",
    description = "Review code changes and suggest improvements",
    opts = {
      auto_submit = true,
    },
    prompts = {
      {
        role = "system",
        content = [[
          Act as a senior software engineer and code reviewer.
          Your task is to review the code changes made in the current git branch, provide constructive feedback, and suggest improvements where necessary.
          Focus on code quality, readability, maintainability, and adherence to best practices.
          Also focus on architectural and design aspects, following these principles:
          - Clean Architecture / DDD / Hexagonal Architecture.
          - SOLID, Liskov Substitution, Dependency Inversion, Single Responsibility.
          - DRY, KISS, YAGNI.
        ]],
      },
      {
        role = "user",
        content = [[
              ### Setup tasks
                 Get the root path of the git repository using @{cmd_runner} and the command `git rev-parse --show-toplevel`.

              ### Steps to follow:
                1. Get the info of the current branch using @{git__git_branch}.
                2. Get the log of commits in the current branch using @{git__git_log}.
                3. Get the diff between the current branch and the main branch using @{git__git_diff}.
                4. Analyze the git diff to identify the changes made in the codebase.
                5. Read the contents of the modified or newly added files using @{read_file} for better context.
                6. Read any other files that might be relevant to understand the changes better.
                7. Provide a detailed code review, highlighting both strengths and areas for improvement.
                8. Suggest specific improvements or refactoring where applicable.
                9. Ensure your feedback is clear, actionable, and respectful.

              ### Variables you have access to:
                - #{mcp:neovim://workspace}: Gives comprehensive information about the current workspace, including file paths and contents.
              ]],
      },
    },
  },
}
