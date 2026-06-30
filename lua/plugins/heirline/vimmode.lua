local colors = require("plugins.heirline.colors")

return {
  init = function(self)
    self.mode = vim.fn.mode(1)
  end,
  static = {
    mode_names = {
      n = "NORMAL",
      no = "O-PEND",
      nov = "O-PEND",
      noV = "O-PEND",
      noCTRLV = "O-PEND",
      niI = "NORMAL",
      niR = "NORMAL",
      niV = "NORMAL",
      v = "VISUAL",
      V = "V-LINE",
      [string.char(22)] = "V-BLOCK",
      s = "SELECT",
      S = "S-LINE",
      [string.char(19)] = "S-BLOCK",
      i = "INSERT",
      ic = "INSERT",
      ix = "INSERT",
      R = "REPLACE",
      Rc = "REPLACE",
      Rx = "REPLACE",
      Rv = "V-REPLACE",
      c = "COMMAND",
      cv = "VIM EX",
      ce = "EX",
      r = "PROMPT",
      rm = "--MORE--",
      ["r?"] = "CONFIRM",
      ["!"] = "SHELL",
      t = "TERMINAL",
    },
  },
  {
    provider = function(self)
      local m = self.mode:sub(1, 1)
      local name = self.mode_names[self.mode] or self.mode_names[m] or "UNK"

      local icon = "  "
      return icon .. name .. " "
    end,
    hl = function(self)
      local color = self.mode_color(self)
      self.fg = color
      return { bg = color, fg = colors.grey, bold = true }
    end,
  },
  {
    provider = "◤",
    hl = function(self)
      return { bg = colors.surface1, fg = self.mode_color(self) }
    end,
  },
  {
    provider = "◤",
    hl = { bg = colors.surface0, fg = colors.surface1 },
  },
}
