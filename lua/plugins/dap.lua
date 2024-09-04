--[[
  Debug Adapter Protocol client implementation for Neovim.
  See: https://github.com/mfussenegger/nvim-dap
]]

return {
  "mfussenegger/nvim-dap",
  config = function()
    local sign = vim.fn.sign_define

    sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
    sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
  end,
  keys = function()
    local dap = require("dap")
    return {
      { "<leader>db", dap.toggle_breakpoint, mode = "n", desc = "Toggle breakpoint", silent = true },
      { "<leader>dc", dap.continue, mode = "n", desc = "[Debuging..] Continue", silent = true },
      { "<leader>dt", dap.terminate, mode = "n", desc = "Terminate debug adapter", silent = true },
      -- Generated code
      -- { "<leader>dc", dap.continue(), mode="n", desc="continue" },
      -- { "<leader>dd", dap.step_over(), mode="n", desc="step over" },
      -- { "<leader>di", dap.step_into(), mode="n", desc="step into" },
      -- { "<leader>do", dap.step_out(), mode="n", desc="step out" },
      -- { "<leader>dr", dap.repl.open(), mode="n", desc="open repl" },
      -- { "<leader>ds", dap.stop(), mode="n", desc="stop" },
      -- { "<leader>dt", dap.toggle_breakpoint(), mode="n", desc="toggle breakpoint" },
      -- { "<leader>du", dap.up(), mode="n", desc="up" },
      -- { "<leader>dx", dap.down(), mode="n", desc="down"
    }
  end,
}
