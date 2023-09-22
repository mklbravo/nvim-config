--[[
  A highly extendable fuzzy finder over lists
  See: https://github.com/nvim-telescope/telescope.nvim
]]

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.3",
  config = function(_, opts)
    require('telescope').setup(opts)

    local telescopeBuiltin = require('telescope.builtin')

    vim.keymap.set('n', '<C-p>', telescopeBuiltin.git_files, { desc = 'Find files (git)' })
    vim.keymap.set('n', '<leader>pf', telescopeBuiltin.find_files, { desc = 'Find files (root)'})
    vim.keymap.set('n', '<leader>ps', telescopeBuiltin.live_grep, { desc = 'Find IN Files'})

  end,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    defaults = {
      file_ignore_patterns = {
        'node_modules',
      },
    },
  },
}
