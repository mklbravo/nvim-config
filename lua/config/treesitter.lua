--[[
  Treesitter configuration and setup
]]

--[[
  Treesitter configuration and setup
]]

local M = {}

-- Single source of truth for managed languages and filetypes
M.lang_ft_map = {
  bash = "sh",
  c = "c",
  cpp = "cpp",
  css = "css",
  dockerfile = "dockerfile",
  go = "go",
  html = "html",
  java = "java",
  javascript = "javascript",
  json = "json",
  lua = "lua",
  markdown = "markdown",
  php = "php",
  python = "python",
  rust = "rust",
  toml = "toml",
  twig = "twig",
  typescript = "typescript",
  vim = "vim",
  yaml = "yaml",
}

function M.setup()
  -- Install Treesitter parsers for all managed languages
  require("nvim-treesitter").install(vim.tbl_keys(M.lang_ft_map))

  -- Build a set of filetypes to avoid duplicates (multiple parsers might use the same filetype)
  local fts_set = {}
  for _, ft in pairs(M.lang_ft_map) do
    fts_set[ft] = true
  end

  -- Flatten the set into a list for autocmd pattern (ensures each filetype appears only once)
  local filetypes = {}
  for ft in pairs(fts_set) do
    table.insert(filetypes, ft)
  end

  -- Enable Treesitter features for managed filetypes
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetypes,
    callback = function(args)
      local ft = args.match
      local lang = vim.treesitter.language.get_lang(ft) or ft

      -- Check if parser exists and enable features
      local ok = pcall(vim.treesitter.language.inspect, lang)
      if ok then
        -- Enable syntax highlighting
        vim.treesitter.start()
        -- Enable code folding
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldmethod = "expr"
        -- Enable indentation (provided by nvim-treesitter)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end,
    desc = "Enable Treesitter features for managed filetypes",
  })
end

return M
