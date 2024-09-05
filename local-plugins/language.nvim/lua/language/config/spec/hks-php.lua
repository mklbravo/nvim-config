return {
  filetype = "php",
  dap = { -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#php
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
  formatter = { -- https://github.com/mhartington/formatter.nvim/blob/master/lua/formatter/defaults/php_cs_fixer.lua
    package = "php-cs-fixer",
    opts = {
      {
        exe = "php-cs-fixer",
        args = {
          "fix",
        },
        stdin = false,
        ignore_exitcode = true,
      },
    },
  },
  linter = { -- https://github.com/mfussenegger/nvim-lint/blob/master/lua/lint/linters/phpstan.lua
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
  lsp = { -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#intelephense
    package = "intelephense",
  },
}
