local colors = require("plugins.heirline.colors")

return {
  {
    provider = " ",
    hl = { bg = colors.statusline_background, fg = colors.ruler_background },
  },
  {
    provider = " %l:%c %p%% ",
    hl = { bg = colors.ruler_background, fg = colors.ruler_foreground, bold = false },
  },
}
