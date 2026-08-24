local colors = require("plugins.heirline.colors")
local has_devicons, devicons = pcall(require, "nvim-web-devicons")

return {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
  {
    provider = function(self)
      local name = self.filename ~= "" and vim.fn.fnamemodify(self.filename, ":t") or "[No Name]"
      local icon = (has_devicons and devicons.get_icon(name, nil, { default = true })) or ""
      return " " .. icon .. " " .. name .. " "
    end,
    hl = { bg = colors.surface, fg = colors.text, bold = true },
  },
  {
    provider = function()
      if vim.bo.modified then
        return "● "
      end
      return ""
    end,
    hl = { bg = colors.surface, fg = colors.modified },
  },
  {
    provider = function()
      if vim.bo.readonly then
        return " "
      end
      return ""
    end,
    hl = { bg = colors.surface, fg = colors.readonly },
  },
  {
    provider = "◤",
    hl = function()
      return { bg = colors.statusline_background, fg = colors.surface }
    end,
  },
}
