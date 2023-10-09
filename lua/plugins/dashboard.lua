--[[
  Vim dashboard
  See: https://github.com/goolord/alpha-nvim
]]

return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    layout = {
      { type = "padding", val = 1 },
      {
        type = "text",
        val = {
          [[ _____ ______   ___  __    ___       ___      ___ ___  _____ ______       ]],
          [[|\   _ \  _   \|\  \|\  \ |\  \     |\  \    /  /|\  \|\   _ \  _   \     ]],
          [[\ \  \\\__\ \  \ \  \/  /|\ \  \    \ \  \  /  / | \  \ \  \\\__\ \  \  ]],
          [[ \ \  \\|__| \  \ \   ___  \ \  \    \ \  \/  / / \ \  \ \  \\|__| \  \  ]],
          [[  \ \  \    \ \  \ \  \\ \  \ \  \____\ \    / /   \ \  \ \  \    \ \  \ ]],
          [[   \ \__\    \ \__\ \__\\ \__\ \_______\ \__/ /     \ \__\ \__\    \ \__\]],
          [[    \|__|     \|__|\|__| \|__|\|_______|\|__|/       \|__|\|__|     \|__|]],
        },
        opts = { hl = "AlphaCol2", position = "center" },
      },
      { type = "padding", val = 1 },
    },
  },
}
