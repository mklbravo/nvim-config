local M = {}

function M.register()
  vim.api.nvim_create_user_command("LanguageUI", function(opts)
    require("language.ui").open()
  end, { nargs = 0 })
end

return M
