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
              ### Steps to follow:
                1. Get the current changes made in the current branch using `git diff main..`.
                2. Read and analyze the git diff output to understand the changes made.
                3. Read other files in the current directory if necessary to get context about the changes.
                4. Perform a thorough code review based on the changes identified in the git diff.

              ### Tools you can use:
                - @{cmd_runner}: A tool that allows you to run shell commands. Use this to get the git diff and to stage and commit changes.
                - @{file_reader}: A tool that allows you to read file contents. Use this to read new or modified files for context.
              ]],
      },
    },
  },
}
