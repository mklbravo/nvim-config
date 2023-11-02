--[[
  Provides configuration for all configured languages
]]

local languages_config = {}

local CONFIGURATION_FILE_PATH = vim.fn.stdpath("config") .. "/lua/languages"

-- Returns the name of *.lua files on `/lua/language` folder.
local function get_language_lua_files()
  local lua_files = assert(
    vim.fn.readdir(CONFIGURATION_FILE_PATH, function(filename)
      return filename:match("%.lua$") and filename ~= "init.lua"
    end),
    "Could not load read directory [" .. CONFIGURATION_FILE_PATH .. "]"
  )
  return lua_files
end

-- Loads the content of the given file
-- @param language_filename string
-- @return any[]
local function load_configuration(language_file)
  return require("languages." .. language_file:gsub("%..+$", ""))
end

-- Returns required packages for enabled languages
-- @return any[]
function languages_config.get_required_packages()
  local packages = {}

  for _, lua_file in ipairs(get_language_lua_files()) do
    local language = load_configuration(lua_file)

    if language.lsp ~= nil and language.lsp.package ~= nil then
      table.insert(packages, language.lsp.package)
    end

    if language.formatter ~= nil and language.formatter.package ~= nil then
      table.insert(packages, language.formatter.package)
    end
  end

  -- TODO: Check unique values
  -- TODO: find better way of getting ids from different types (lsp,formatter, etc)
  return packages
end

-- Returns enabled LSP configurations
-- @return any[]
function languages_config.get_lsp_configs()
  local lsp_configs = {}

  for _, lua_file in ipairs(get_language_lua_files()) do
    local language_config = load_configuration(lua_file)

    if language_config.lsp ~= nil then
      table.insert(lsp_configs, language_config.lsp)
    end
  end

  return lsp_configs
end

return languages_config
