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
function languages_config.get_package_names()
  local packages = {}

  for _, luaFile in ipairs(get_language_lua_files()) do
    local language = require("languages." .. luaFile:gsub("%..+$", ""))

    if language.lsp ~= nil and language.lsp.id ~= nil then
      table.insert(packages, language.lsp.id)
    end

    if language.formatter ~= nil and language.formatter.id ~= nil then
      table.insert(packages, language.formatter.id)
    end
  end

  -- TODO: Check unique values
  -- TODO: find better way of getting ids from different types (lsp,formatter, etc)
  return packages
end

return languages_config
