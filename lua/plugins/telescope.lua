--[[
  A highly extendable fuzzy finder over lists
  See: https://github.com/nvim-telescope/telescope.nvim
]]

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.3",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files' }
  }
}
