local colors = require("plugins.heirline.colors")

return {
  condition = function()
    return #vim.api.nvim_list_wins() > 1
  end,
  provider = "    ",
  hl = { fg = colors.blue, bold = true },
}
