local colors = require("plugins.heirline.colors")

return {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
  {
    provider = function(self)
      if self.filename == "" then
        return "[No Name]"
      end
      -- Get relative path from current working directory
      local rel_path = vim.fn.fnamemodify(self.filename, ":.")
      -- Replace path separators with breadcrumb separator
      local breadcrumb = rel_path:gsub("/", "  > ")
      return breadcrumb
    end,
    hl = { fg = colors.lavender },
  },
}
