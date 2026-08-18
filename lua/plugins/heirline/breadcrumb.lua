local colors = require("plugins.heirline.colors")

return {
  {
    provider = "  ",
    hl = { fg = colors.peach },
  },
  {
    init = function(self)
      self.filename = vim.api.nvim_buf_get_name(0)

      -- Parse segments from filename
      if self.filename == "" or self.filename:match("^term:") then
        self.segments = {}
      else
        local rel_path = vim.fn.fnamemodify(self.filename, ":.")
        self.segments = vim.split(rel_path, "/")
      end
    end,

    -- Generate components for each segment and separator dynamically
    (function()
      local components = {}
      local MAX_DEPTH = 15 -- Support up to 15 path levels

      for i = 1, MAX_DEPTH do
        -- Path segment component
        table.insert(components, {
          provider = function(self)
            return self.segments[i] or ""
          end,
          hl = function(self)
            -- Make the last segment (filename) bold
            if self.segments[i + 1] == nil then
              return { fg = colors.lavender, bold = true }
            else
              return { fg = colors.lavender }
            end
          end,
          condition = function(self)
            return self.segments[i] ~= nil
          end,
        })

        -- Separator component (only if there's a next segment)
        table.insert(components, {
          provider = " / ",
          hl = { fg = colors.peach },
          condition = function(self)
            return self.segments[i] ~= nil and self.segments[i + 1] ~= nil
          end,
        })
      end

      return components
    end)(),
  },
}
