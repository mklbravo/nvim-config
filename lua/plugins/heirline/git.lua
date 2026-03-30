local colors = require("plugins.heirline.colors")
local conditions = require("heirline.conditions")

return {
  condition = conditions.is_git_repo,
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    -- Check if it's a GitHub repo
    local ok, remote_url = pcall(function()
      return vim.fn.system("git config --get remote.origin.url"):gsub("\n", "")
    end)
    self.is_github = ok and (remote_url:find("github%.com") ~= nil or remote_url:find("github:") ~= nil)
  end,
  {
    provider = function(self)
      local icon = self.is_github and "󰊤 " or ""
      return " " .. icon .. (self.status_dict and self.status_dict.head or "")
    end,
    hl = { fg = colors.text, bold = true },
  },
  {
    provider = function(self)
      if not self.status_dict then
        return ""
      end
      return (self.status_dict.added and self.status_dict.added > 0) and ("  " .. self.status_dict.added) or ""
    end,
    hl = { fg = colors.green },
  },
  {
    provider = function(self)
      if not self.status_dict then
        return ""
      end
      return (self.status_dict.changed and self.status_dict.changed > 0) and ("  " .. self.status_dict.changed) or ""
    end,
    hl = { fg = colors.yellow },
  },
  {
    provider = function(self)
      if not self.status_dict then
        return ""
      end
      return (self.status_dict.removed and self.status_dict.removed > 0) and ("  " .. self.status_dict.removed) or ""
    end,
    hl = { fg = colors.red },
  },
}
