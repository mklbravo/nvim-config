local M = {}

local CONFIG_AVAILABLE_LANGUAGES = "language_available_languages"
local CONFIG_ENABLED_LANGUAGES = "language_enabled_languages"

local persistent_storage = require("language.config.persistent_storage")

local function set_enabled_languages(languages)
  vim.api.nvim_set_var(CONFIG_ENABLED_LANGUAGES, languages)
  persistent_storage.save(languages)
end

local function get_current_file_path()
  -- Check if there is a better way to get the current file path/ path of spec folder
  local source = debug.getinfo(1, "S").source
  local plugin_directory = source:match("@?(.*/)")
  return plugin_directory or "."
end

local function get_available_languages_from_spec_folder()
  local specs_path = get_current_file_path() .. "./spec"

  local language_spec_files = assert(vim.fn.readdir(specs_path), "Could not load read directory [" .. specs_path .. "]")
  local language_specs = {}

  for _, file in ipairs(language_spec_files) do
    -- Remove the file extension
    local base_name = file:match("(.+)%..+$") or file
    table.insert(language_specs, base_name)
  end

  return language_specs
end

function M.get_available_languages()
  local status_ok, available_languages = pcall(vim.api.nvim_get_var, CONFIG_AVAILABLE_LANGUAGES)
  if status_ok then
    return available_languages
  end

  available_languages = get_available_languages_from_spec_folder()

  vim.api.nvim_set_var(CONFIG_AVAILABLE_LANGUAGES, available_languages)
  return available_languages
end

function M.get_enabled_languages()
  local status_ok, enabled_languages = pcall(vim.api.nvim_get_var, CONFIG_ENABLED_LANGUAGES)
  if status_ok then
    return enabled_languages
  end
  local stored_data = persistent_storage.read()
  vim.api.nvim_set_var(CONFIG_ENABLED_LANGUAGES, stored_data)
  return stored_data
end

-- TODO: Rename function
function M.enable_language(language)
  local enabled_languages = M.get_enabled_languages()
  if not vim.tbl_contains(enabled_languages, language) then
    table.insert(enabled_languages, language)

    set_enabled_languages(enabled_languages)
  end
end

-- TODO: Rename function
function M.disable_language(language)
  local enabled_languages = M.get_enabled_languages()

  if vim.tbl_contains(enabled_languages, language) then
    for index, value in ipairs(enabled_languages) do
      if value == language then
        table.remove(enabled_languages, index)
        break
      end
    end

    set_enabled_languages(enabled_languages)
  end
end

function M.is_language_enabled(language)
  local enabled_languages = M.get_enabled_languages()
  return vim.tbl_contains(enabled_languages, language)
end

return M
