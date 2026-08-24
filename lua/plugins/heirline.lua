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

    -- Load Heirline and utility functions
    local heirline = require("heirline")
    local conditions = require("heirline.conditions")

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
          n = colors.mode_normal,
          i = colors.mode_insert,
          v = colors.mode_visual,
          V = colors.mode_visual,
          [string.char(22)] = colors.mode_visual,
          c = colors.mode_command,
          s = colors.mode_select,
          S = colors.mode_select,
          [string.char(19)] = colors.mode_select,
          R = colors.mode_replace,
          t = colors.mode_command,
        },
        mode_color = function(self)
          local mode = vim.fn.mode(1):sub(1, 1)
          return self.mode_colors_map[mode] or colors.mode_normal
        end,
      },
      hl = { fg = colors.statusline_foreground, bg = colors.statusline_background },
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

    local TablineBuffers = require("plugins.heirline.tabline_buffers")

    local Tabline = {
      TablineBuffers(),
    }

    heirline.setup({
      statusline = StatusLine,
      tabline = Tabline,
      winbar = Breadcrumb,
      opts = {
        colors = colors.setup,
        disable_winbar_cb = function(args)
          return conditions.buffer_matches({
            buftype = { "nofile", "prompt", "help", "quickfix" },
            filetype = { "^git.*", "fugitive", "Trouble", "dashboard", "snacks_terminal" },
          }, args.buf)
        end,
      },
    })
  end,
}
