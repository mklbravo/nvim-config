local M = {}
local config = require("language.config")
local manager = require("language.manager")

function M.setup()
  for _, language in ipairs(config.get_enabled_languages()) do
    manager.apply_language_configuration(language)
  end

  vim.api.nvim_create_user_command("LanguageUI", "lua require('language.ui').open()", { nargs = 0 })
end

return M
