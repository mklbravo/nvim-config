--[[
  Neovim Lua plugin to remove buffers.
  See: https://github.com/echasnovski/mini.bufremove
]]

return {
  "echasnovski/mini.bufremove",
  config = true,
  version = "*",
  keys = function()
    local bufremove_delete = require("mini.bufremove").delete

    return {
      {
        "<leader>bd",
        function()
          if vim.bo.modified ~= true then
            bufremove_delete(0)
            return
          end

          local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
          if choice == 1 then -- Yes
            vim.cmd.write()
            bufremove_delete(0)
          elseif choice == 2 then -- No
            bufremove_delete(0, true)
          end
        end,
        desc = "Delete Buffer",
      },
      {
        "<leader>bD",
        function()
          bufremove_delete(0, true)
        end,
        desc = "Delete Buffer (Force)",
      },
    }
  end,
}
