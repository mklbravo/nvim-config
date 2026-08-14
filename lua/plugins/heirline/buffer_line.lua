local colors = require("plugins.heirline.colors")
local has_devicons, devicons = pcall(require, "nvim-web-devicons")

-- Helper to safely get icon, with fallback
local function get_icon(filename)
  if has_devicons then
    return devicons.get_icon(filename, nil, { default = true })
  end
  return "f"  -- Generic file icon fallback
end

return function()
  return {
    init = function(self)
      self.bufnr = self.bufnr or self.__bufnr or 0
      local name = vim.api.nvim_buf_get_name(self.bufnr)
      self.filename = vim.fn.fnamemodify(name, ":t")
      if self.filename == "" then
        self.filename = "[No Name]"
      end
      self.is_active = self.bufnr == vim.api.nvim_get_current_buf()
      self.is_modified = vim.bo[self.bufnr].modified
    end,
    on_click = {
      callback = function(_, minwid)
        vim.api.nvim_set_current_buf(minwid)
      end,
      minwid = function(self)
        return self.bufnr
      end,
      name = "heirline_tabline_buffer_select",
    },
    -- Accent bar on left side of active buffer
    {
      provider = function(self)
        return self.is_active and "▎" or " "
      end,
      hl = function(self)
        if self.is_active then
          return { fg = colors.blue }
        end
      end,
    },
    -- File icon
    {
      provider = function(self)
        local icon = get_icon(self.filename)
        return " " .. icon .. " "
      end,
      hl = function(self)
        if self.is_active then
          return { fg = colors.text, bg = colors.surface0, bold = true }
        else
          return { fg = colors.subtext0, bg = colors.crust }
        end
      end,
    },
    -- Filename
    {
      provider = function(self)
        return self.filename
      end,
      hl = function(self)
        if self.is_active then
          return { fg = colors.text, bg = colors.surface0, bold = true }
        else
          return { fg = colors.subtext0, bg = colors.crust }
        end
      end,
    },
    -- Modified marker
    {
      provider = function(self)
        if self.is_modified then
          return " ●"
        end
        return ""
      end,
      hl = function(self)
        if self.is_active then
          return { fg = colors.red, bg = colors.surface0 }
        else
          return { fg = colors.red, bg = colors.crust }
        end
      end,
    },
    -- Close button
    {
      provider = " ×",
      hl = function(self)
        if self.is_active then
          return { fg = colors.text, bg = colors.surface0 }
        else
          return { fg = colors.subtext0, bg = colors.crust }
        end
      end,
      on_click = {
        callback = function(_, minwid)
          vim.api.nvim_buf_delete(minwid, { force = false })
        end,
        minwid = function(self)
          return self.bufnr
        end,
        name = "heirline_tabline_buffer_close",
      },
    },
    -- Spacing between tabs
    {
      provider = " ",
      hl = function(self)
        if self.is_active then
          return { bg = colors.surface0 }
        else
          return { bg = colors.crust }
        end
      end,
    },
  }
end
