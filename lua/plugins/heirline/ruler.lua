local colors = require("plugins.heirline.colors")

return {
  {
    provider = " ",
    hl = { bg = colors.bg, fg = colors.teal },
  },
  {
    provider = " %l:%c %p%% ",
    hl = { bg = colors.teal, fg = colors.grey, bold = false },
  },
}
