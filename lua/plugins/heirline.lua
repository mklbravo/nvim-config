--[[
  No-nonsense Neovim Statusline plugin designed around recursive inheritance to be exceptionally fast and versatile.
  See: https://github.com/rebelot/heirline.nvim
]]

return {
  "rebelot/heirline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "BufReadPre",
  config = function()
    local heirline = require("heirline")
    local utils = require("heirline.utils")

    local TablineBufnr = {
      provider = function(self)
        return " " .. tostring(self.bufnr) .. ". "
      end,
      hl = "Comment",
    }

    local TablineFileName = {
      init = function(self)
        self.filename = vim.api.nvim_buf_get_name(self.bufnr)
      end,
      provider = function(self)
        local filename = self.filename
        filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
        return " " .. filename .. ""
      end,
      hl = function(self)
        return { bold = self.is_active or self.is_visible, italic = true }
      end,
    }

    local tabLineBlock = {
      hl = function(self)
        if self.is_active then
          return "TabLineSel"
        elseif not vim.api.nvim_buf_is_loaded(self.bufnr) then
          return { fg = "gray" }
        else
          return "TabLine"
        end
      end,
      TablineBufnr,
      TablineFileName,
    }

    local tablineBufferBlock = utils.surround({ "", "" }, function(self)
      -- if self.is_active then
      --   return {
      --     fg = "purple",
      --     bg = "gray",
      --   }
      -- else
      --   return {
      --     fg = "gray",
      --     bg = "gray",
      --   }
      -- end
    end, { tabLineBlock })

    local tabLine = utils.make_buflist(
      tablineBufferBlock,
      { provider = "", hl = { fg = "gray" } }, -- left truncation, optional (defaults to "<")
      { provider = "", hl = { fg = "gray" } } -- right trunctation, also optional (defaults to ...... yep, ">")
    )

    vim.o.showtabline = 2

    heirline.setup({
      tabline = tabLine,
    })
  end,
}
