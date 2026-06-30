local colors = require("plugins.heirline.colors")
local has_devicons, devicons = pcall(require, "nvim-web-devicons")

return function()
  return {
    init = function(self)
      self.bufnr = self.bufnr or self.__bufnr or 0
      local name = vim.api.nvim_buf_get_name(self.bufnr)
      self.filename = vim.fn.fnamemodify(name, ":t")
      self.is_active = self.bufnr == vim.api.nvim_get_current_buf()
      self.is_modified = vim.bo[self.bufnr].modified
    end,
    on_click = {
      callback = function(_, minwid, _, button)
        if button == "m" then
          vim.api.nvim_buf_delete(minwid, { force = false })
        else
          vim.api.nvim_set_current_buf(minwid)
        end
      end,
      minwid = function(self)
        return self.bufnr
      end,
      name = "heirline_tabline_buffer_callback",
    },
    {
      provider = function(self)
        local icon = ""
        if has_devicons then
          icon = devicons.get_icon(self.filename, nil, { default = true })
        end
        return " " .. (icon or "")
      end,
      hl = function(self)
        if self.is_active then
          return { fg = colors.blue, bold = true }
        else
          return { fg = colors.grey }
        end
      end,
    },
    {
      provider = function(self)
        return self.filename .. " "
      end,
      hl = function(self)
        if self.is_active then
          return { bold = true }
        else
          return {}
        end
      end
    },
    {
      provider = function(self)
        if self.is_modified then
          return "● "
        end
        return ""
      end,
      hl = { fg = colors.red },
    },
    {
      provider = function(self)
        return " "
      end,
      hl = { fg = colors.red },
      on_click = {
        callback = function(_, minwid)
          vim.api.nvim_buf_delete(minwid, { force = false })
        end,
        minwid = function(self)
          return self.bufnr
        end,
        name = "heirline_tabline_buffer_close_callback",
      },
    },
    {
      provider = function()
        return "|"
      end,
      hl = { fg = colors.grey },
    },
  }
end
