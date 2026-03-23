-- As of 2024, ESLint LSP (eslint-lsp) is recommended as the primary provider for both linting and formatting in Neovim.
-- See: LazyVim, Mason, and nvim-lspconfig docs. Prettier is unnecessary unless you need broader formatting rules.
-- This spec uses only ESLint LSP for LSP, linting (via eslint_d for CLI/Fix), and formatting, for closest parity to VSCode.

return {
  filetype = "javascript",
  lsp = {
    package = "eslint-lsp",
  },
  linter = {
    package = "eslint_d",
    opts = function()
      return require("lint.filetypes.javascript").eslint_d()
    end,
  },
  formatter = {
    package = "eslint-lsp",
    -- No opts needed; ESLint LSP handles formatting via LSP interface.
  },
}
