--[[
  A completion plugin for neovim coded in Lua.
  See: https://github.com/hrsh7th/nvim-cmp

  Extensions:
    * https://github.com/hrsh7th/cmp-buffer   -- nvim-cmp source for buffer words
    * https://github.com/hrsh7th/cmp-nvim-lsp -- nvim-cmp source for neovim builtin LSP client
    * https://github.com/hrsh7th/cmp-path     -- nvim-cmp source for path
    * https://github.com/hrsh7th/cmp-cmdline  -- nvim-cmp source for cmline
    * https://github.com/hrsh7th/cmp-vsnip    -- nvim-cmp source for vim-vsnip

  Tools:
    * https://github.com/onsails/lspkind.nvim -- vscode-like pictograms for neovim lsp completion items
]]

return {
  "hrsh7th/nvim-cmp",
  event = {
    "CmdlineEnter",
    "InsertEnter",
  },
  dependencies = {
    -- Dependency
    "neovim/nvim-lspconfig",
    "hrsh7th/vim-vsnip", -- TODO: create configuration file for this plugin
    -- Extensions
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    'hrsh7th/cmp-vsnip',
    -- Tools
    "onsails/lspkind-nvim",
  },
  config = function(_, opts)
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    opts.formatting = {
      format = lspkind.cmp_format({
        mode = "symbol_text",
      }),
    }

    opts.mapping = cmp.mapping.preset.insert({
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    })

    opts.snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    }

    opts.sources = cmp.config.sources({
      { name = "buffer" },
      { name = "nvim_lsp" },
      { name = "path" },
    })

    -- Add borders to completion menu
    opts.window = {
      completion = cmp.config.window.bordered({
        winhighlight = "Normal:TelescopeNormal,FloatBorder:TelescopeBorder,CursorLine:PmenuSel",
        scroll_off = true,
        col_offset = 1,
        side_padding = 1,
      }),

      documentation = cmp.config.window.bordered({
        winhighlight = "Normal:TelescopeNormal,FloatBorder:TelescopeBorder,CursorLine:PmenuSel",
      }),
    }

    cmp.setup(opts)

    -- Use buffer source for `/` and `?`
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- Use cmdline & path source for `:`
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
  end,
}
