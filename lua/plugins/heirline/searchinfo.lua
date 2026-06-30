local colors = require("plugins.heirline.colors")
local left_separator = require("plugins.heirline.separator-left")

return {
  condition = function()
    local pattern = vim.fn.getreg("/")
    return vim.v.hlsearch == 1 and pattern ~= ""
  end,
  init = function(self)
    self.pattern = vim.fn.getreg("/")
    local ok, result = pcall(function()
      local search_count = vim.fn.searchcount({ maxcount = 9999, timeout = 50 })
      return search_count
    end)
    if ok and result then
      self.current = result.current
      self.total = result.total
    else
      self.current = 0
      self.total = 0
    end
  end,
  left_separator,
  {
    provider = function(self)
      return string.format(" %s (%d/%d)", self.pattern, self.current, self.total)
    end,
    hl = function(self)
      if self.total > 0 then
        return { fg = colors.sky, bold = true }
      else
        return { fg = colors.subtext0 }
      end
    end,
  },
}
