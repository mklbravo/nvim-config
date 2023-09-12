--[[
  A snazzy buffer line (with tabpage integration)
  See: https://github.com/akinsho/bufferline.nvim
]]

return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  version = "*",
  opts = {
    options = {
      offsets = {
        {
          filetype = "neo-tree",
          text = "Explorer",
          highlight = "Directory",
          text_align = "left",
          separator = true,
        },
      },
      separator_style = "padded_slant",
    },
  },
}
