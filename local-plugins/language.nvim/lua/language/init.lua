local M = {}
local config = require("language.config")
local manager = require("language.manager")

function M.setup()
  for _, language in ipairs(config.get_enabled_languages()) do
    manager.apply_language_configuration(language)
  end

  -- Register the commands
  require("language.command.language_enable").register()
  require("language.command.language_ui").register()
end

return M
