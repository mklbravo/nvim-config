local M = {}

local config = require("language.config")
local manager = require("language.manager")
local supported_languages = config.get_available_languages()

-- Autocomplete function for the command
local function autocomplete_languages(arg_lead, _, _)
  local matches = {}
  for _, lang in ipairs(supported_languages) do
    if lang:match("^" .. arg_lead) then
      table.insert(matches, lang)
    end
  end
  return matches
end

function M.register()
  vim.api.nvim_create_user_command("LanguageEnable", function(opts)
    if #opts.fargs == 0 then
      print("No language provided. Usage: LanguageEnable <language1> <language2> ...")
      return
    end

    for _, language in ipairs(opts.fargs) do
      if not vim.tbl_contains(supported_languages, language) then
        print("Language not supported: " .. language)
        return
      end

      if not config.is_language_enabled(language) then
        print("Required packages will be installed:")
        manager.install_language_packages(language)
        config.enable_language(language)
        print(string.format("Language enabled: '%s'. Please restart Neovim to apply change.", language))
      else
        print(string.format("Language already enabled: '%s'", language))
      end
    end
  end, {
    nargs = "+",
    complete = autocomplete_languages,
  })
end

return M
