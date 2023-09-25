--[[
  Quickstart configs for Nvim LSP
  See: https://github.com/neovim/nvim-lspconfig
]]

return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspConfig = require("lspconfig")
    lspConfig.lua_ls.setup({})
  end,
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  keys = function()
    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(event)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = event.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = event.buf, desc = "Go to declaration" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf, desc = "Go to definition" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = event.buf, desc = "Go to implementation" })
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<space>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = event.buf, desc = "Find references" })
        vim.keymap.set("n", "<space>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end,
    })

    return {
      { "<space>e", vim.diagnostic.open_float, mode = "n", desc = "Open diagnostic on float window" },
      { "[d", vim.diagnostic.goto_prev, mode = "n", desc = "Prevent.ous diagnostic" },
      { "]d", vim.diagnostic.goto_next, mode = "n", desc = "Next diagnostic" },
      { "<space>q", vim.diagnostic.setloclist, mode = "n" },
    }
  end,
}
