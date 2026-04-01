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

  vim.api.nvim_create_autocmd("FileType", {
    pattern = table.concat(filetypes, ","),
    callback = function()
      vim.treesitter.start()
    end,
    desc = "Ensure Treesitter highlighting for managed filetypes",
  })
end

return M
