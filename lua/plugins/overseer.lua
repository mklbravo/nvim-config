--[[
  A task runner and job management plugin for Neovim
  See: https://github.com/stevearc/overseer.nvim
]]

return {
  "stevearc/overseer.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  opts = true,
  keys = function()
    vim.api.nvim_create_user_command("OverseerRestartLast", function()
      local overseer = require("overseer")
      local tasks = overseer.list_tasks({ recent_first = true })
      if vim.tbl_isempty(tasks) then
        vim.notify("No tasks found", vim.log.levels.WARN)
      else
        overseer.run_action(tasks[1], "restart")
      end
    end, {})

    return {
      {
        "<leader>R",
        ":OverseerRun<CR>",
        mode = "n",
        desc = "Select task to run",
        silent = true,
      },
      {
        "<leader>rl",
        ":OverseerRestartLast<CR>",
        mode = "n",
        desc = "Restart last task",
        silent = true,
      },
      {
        "<leader>et",
        ":OverseerToggle<CR>",
        mode = "n",
        desc = "Explore task list",
        silent = true,
      },
    }
  end,
}
