local colors = require("plugins.heirline.colors")

return {
  provider = function()
    return string.upper(vim.bo.filetype or "none")
  end,
  hl = { fg = colors.cyan, bold = true },
}
