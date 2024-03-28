--[[
 A UI for nvim-dap
 See: https://github.com/rcarriga/nvim-dap-ui
]]

return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    -- TODO: Mirar si uso esto, o mejor lo abro/cierro manualmente
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end

    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
    -- TODO: end
  end,
  keys = function()
    local dapui = require("dapui")

    return {
      { "<leader>D", dapui.toggle, mode = "n", desc = "Toggle debug UI", silent = true },
    }
  end,
}
