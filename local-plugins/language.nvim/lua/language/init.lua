local M = {}

function M.setup(config)
  vim.api.nvim_command("echo 'Hello from init.lua'")
  print("My local plugin is loaded!")
  print("Config: ", config)
  vim.api.nvim_create_user_command("LanguageUI", "lua require('language.ui').open()", { nargs = 0 })
end

return M
