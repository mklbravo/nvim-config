--[[
  Vim dashboard
  See: https://github.com/goolord/alpha-nvim
]]

return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function(_, opts)
    local alpha = require("alpha")
    local dashboardTheme = require("alpha.themes.dashboard")

    dashboardTheme.section.header.val = opts.header
    dashboardTheme.section.buttons.val = {
      dashboardTheme.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
      dashboardTheme.button("f", "󰈞  > Find file", ":Telescope find_files<CR>"),
      dashboardTheme.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
      dashboardTheme.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h<CR>"),
      dashboardTheme.button("q", "󰗼  > Quit NVIM", ":qa<CR>"),
    }

    alpha.setup(dashboardTheme.opts)
  end,
  opts = {
    header = {
      [[ _____ ______   ___  __    ___       ___      ___ ___  _____ ______      ]],
      [[|\   _ \  _   \|\  \|\  \ |\  \     |\  \    /  /|\  \|\   _ \  _   \    ]],
      [[\ \  \\\__\ \  \ \  \/  /|\ \  \    \ \  \  /  / | \  \ \  \\\__\ \  \   ]],
      [[ \ \  \\|__| \  \ \   ___  \ \  \    \ \  \/  / / \ \  \ \  \\|__| \  \  ]],
      [[  \ \  \    \ \  \ \  \\ \  \ \  \____\ \    / /   \ \  \ \  \    \ \  \ ]],
      [[   \ \__\    \ \__\ \__\\ \__\ \_______\ \__/ /     \ \__\ \__\    \ \__\]],
      [[    \|__|     \|__|\|__| \|__|\|_______|\|__|/       \|__|\|__|     \|__|]],
    },
  },
}