local BufferLine = require("plugins.heirline.buffer_line")
local utils = require("heirline.utils")
local colors = require("plugins.heirline.colors")

return function()
  return utils.make_buflist(
    BufferLine(),
    {
      provider = "◄",
      hl = { fg = colors.text_muted, bg = colors.tabline_background },
    },
    {
      provider = "►",
      hl = { fg = colors.text_muted, bg = colors.tabline_background },
    }
  )
end
