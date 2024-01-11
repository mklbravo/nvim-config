--[[
  A blazing fast and easy to configure Neovim statusline written in Lua.
  See: https://github.com/nvim-lualine/lualine.nvim
]]

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      globalstatus = true,
      icons_enabled = true,
      theme = "catppuccin",
    },
    sections = {
      -- Section C
      -- ---------
      lualine_c = {
        {
          "filetype",
          colored = true,
          icon_only = true,
          padding = {
            left = 1,
            right = 0,
          },
          separator = "",
        },
        {
          "filename",
          path = 1,
          symbols = {
            modified = " ㋱ ",
            readonly = "",
            unnamed = "",
          },
        },
      },
      -- Section X
      -- ---------
      lualine_x = {
        "overseer",
        "encoding",
        "fileformat",
      },
    },
  },
}
