local colors = require("plugins.heirline.colors")
local conditions = require("heirline.conditions")
local right_separator = require("plugins.heirline.separator-right")

return {
  condition = conditions.lsp_attached,
  init = function(self)
    self.copilot_active = false

    local clients = vim.lsp.get_clients({ bufnr = 0 })
    local client_names = {}
    for _, client in ipairs(clients) do
      if client.name ~= "null-ls" then
        if client.name == "GitHub Copilot" then
          self.copilot_active = true
        else
          table.insert(client_names, client.name)
        end
      end
    end
    self.client_names = client_names
  end,
  {
    provider = function(self)
      if self.copilot_active then
        return "  "
      end
      return ""
    end,
    hl = { fg = colors.text, bold = true },
  },
  {
    provider = "  ",
    hl = { fg = colors.green, bold = true },
  },
  {
    provider = function(self)
      if #self.client_names == 0 then
        return ""
      end
      return table.concat(self.client_names, ", ")
    end,
    hl = { fg = colors.sky },
  },
  right_separator,
}
