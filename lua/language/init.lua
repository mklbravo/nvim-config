--[[
  Provides configuration for all configured languages
]]
local languageConfiguration = {}

local CONFIGURATION_FILE_PATH = vim.fn.stdpath("config") .. "/lua/language"

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

languageConfiguration.getRequirements = function()
  local requirements = {}

  for _, files in ipairs(get_language_lua_files()) do
    print(files)
  end

  for _, luaFile in ipairs(get_language_lua_files()) do
    local language = require("language." .. luaFile:gsub("%..+$", ""))
    for _, languageRequirement in ipairs(language.requirements) do
      table.insert(requirements, languageRequirement)
    end
  end

  return requirements
end

return languageConfiguration
