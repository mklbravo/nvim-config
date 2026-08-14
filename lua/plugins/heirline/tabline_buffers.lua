local BufferLine = require("plugins.heirline.buffer_line")
local utils = require("heirline.utils")
local colors = require("plugins.heirline.colors")

return function()
  return utils.make_buflist(
    BufferLine(),
    {
      provider = "◄",
      hl = { fg = colors.subtext0, bg = colors.crust },
    },
    {
      provider = "►",
      hl = { fg = colors.subtext0, bg = colors.crust },
    }
  )
end
