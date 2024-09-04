local M = {}

local DATA_FILE = vim.fn.stdpath("data") .. "/language_nvim_data.json"

function M.read()
  local file = io.open(DATA_FILE, "r")
  if not file then
    return {}
  end
  local content = file:read("*a")
  file:close()
  return vim.fn.json_decode(content) or {}
end

function M.save(languages)
  local file = io.open(DATA_FILE, "w")
  if file then
    file:write(vim.fn.json_encode(languages))
    file:close()
  end
end

return M
