--[[
 A UI for nvim-dap
 See: https://github.com/rcarriga/nvim-dap-ui
]]

return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function()
    require("dapui").setup()
  end,
}
