--[[
  Modern fuzzy-finder to navigate the Neovim universe.
  See: https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
]]

---@diagnostic disable: undefined-global
---@type SnacksConfig
return {
  opts = {
    sources = {
      gh_issue = {
        -- Leave it empty to use the default settings
      },
      gh_pr = {
        -- Leave it empty to use the default settings
      },
    },
  },
  keys = {
    {
      "<leader>gi",
      function()
        Snacks.picker.gh_issue()
      end,
      desc = "GitHub Issues (open)",
    },
    {
      "<leader>gI",
      function()
        Snacks.picker.gh_issue({ state = "all" })
      end,
      desc = "GitHub Issues (all)",
    },
    {
      "<leader>gp",
      function()
        Snacks.picker.gh_pr()
      end,
      desc = "GitHub Pull Requests (open)",
    },
    {
      "<leader>gP",
      function()
        Snacks.picker.gh_pr({ state = "all" })
      end,
      desc = "GitHub Pull Requests (all)",
    },
  },
}
