local utils = require("heirline.utils")
local BufferLine = require("plugins.heirline.buffer_line")

return function()
  return utils.make_buflist(BufferLine(), {
    provider = function()
      return ""
    end,
  }, {
    provider = function()
      return ""
    end,
  })
end
