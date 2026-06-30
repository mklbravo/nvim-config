return {
  "rebelot/heirline.nvim",
  lazy = false,
  priority = 60,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- Make the statusline global instead of per window
    vim.o.laststatus = 3
    -- Enable tabline display
    vim.o.showtabline = 2

    local heirline = require("heirline")

    -- Compose components from submodules
    local Diagnostics = require("plugins.heirline.diagnostics")
    local FileNameBlock = require("plugins.heirline.filename")
    local FileType = require("plugins.heirline.filetype")
    local Git = require("plugins.heirline.git")
    local LspInfo = require("plugins.heirline.lsp_info")
    local Ruler = require("plugins.heirline.ruler")
    local SearchInfo = require("plugins.heirline.searchinfo")
    local ViMode = require("plugins.heirline.vimmode")
    local Breadcrumb = require("plugins.heirline.breadcrumb")
    local colors = require("plugins.heirline.colors")

    local StatusLine = {
      static = {
        mode_colors_map = {
          n = colors.blue,
          i = colors.green,
          v = colors.yellow,
          V = colors.yellow,
          [string.char(22)] = colors.yellow,
          c = colors.cyan,
          s = colors.red,
          S = colors.red,
          [string.char(19)] = colors.red,
          R = colors.red,
          t = colors.cyan,
        },
        mode_color = function(self)
          local mode = vim.fn.mode(1):sub(1, 1)
          return self.mode_colors_map[mode] or colors.blue
        end,
      },
      hl = { fg = colors.fg, bg = colors.bg },
      ViMode,
      FileNameBlock,
      Git,
      SearchInfo,
      { provider = "%=" }, -- Separator to push the following components to the right
      LspInfo,
      Diagnostics,
      FileType,
      Ruler,
    }

    local TablineOffset = require("plugins.heirline.tabline_offset")
    local TablineBuffers = require("plugins.heirline.tabline_buffers")

    local Tabline = {
      TablineOffset,
      TablineBuffers(),
    }

    heirline.setup({
      statusline = StatusLine,
      tabline = Tabline,
      winbar = Breadcrumb,
    })
  end,
}
