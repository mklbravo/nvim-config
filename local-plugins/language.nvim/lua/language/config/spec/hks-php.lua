return {
  filetype = "php",
  -- See: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#php
  dap = {
    package = "php-debug-adapter",
    adapter = {
      type = "executable",
      command = "node",
      args = { vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
    },
    configuration = {
      type = "php",
      request = "launch",
      name = "Listen for Xdebug",
      port = 9003,
    },
  },
  -- See: https://github.com/mhartington/formatter.nvim/blob/master/lua/formatter/defaults/php_cs_fixer.lua
  formatter = {
    package = "php-cs-fixer",
    opts = function()
      local opts = require("formatter.filetypes.php").php_cs_fixer()
      table.insert(opts.args, "--allow-risky=yes")
      return opts
    end,
  },
  -- See: https://github.com/mfussenegger/nvim-lint/blob/master/lua/lint/linters/phpstan.lua
  linter = {
    package = "phpstan",
    opts = {
      args = {
        "analyze",
        "--error-format=json",
        "--memory-limit=2G",
        "--no-progress",
      },
    },
  },
  -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#intelephense
  lsp = {
    package = "intelephense",
  },
}
