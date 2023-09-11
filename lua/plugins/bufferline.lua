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
    separator_style = "padded_slant",
    offsets = {
      {
        filetype = "neo-tree",
        text = "Neo-tree",
        highlight = "Directory",
        text_align = "left",
        separator = true,
      },
    },
  }
}
