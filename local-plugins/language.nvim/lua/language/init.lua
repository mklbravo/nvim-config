local M = {}

function M.setup(config)
  vim.api.nvim_command("echo 'Hello from init.lua'")
  print("My local plugin is loaded!")
  print("Config: ", config)
end

return M
