local colors = require("plugins.heirline.colors")
local conditions = require("heirline.conditions")

return {
  condition = conditions.has_diagnostics,
  static = {
    error_icon = " ",
    warn_icon = " ",
    info_icon = " ",
    hint_icon = " ",
  },
  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,
  {
    provider = function(self)
      return self.errors > 0 and (self.error_icon .. self.errors .. " ") or ""
    end,
    hl = { fg = colors.error },
  },
  {
    provider = function(self)
      return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ") or ""
    end,
    hl = { fg = colors.warning },
  },
  {
    provider = function(self)
      return self.info > 0 and (self.info_icon .. self.info .. " ") or ""
    end,
    hl = { fg = colors.info },
  },
  {
    provider = function(self)
      return self.hints > 0 and (self.hint_icon .. self.hints .. " ") or ""
    end,
    hl = { fg = colors.hint },
  },
}
