return {
  "leoluz/nvim-dap-go",
  dependencies = { "mfussenegger/nvim-dap" },
  ft = "go",
  opts = function(_, opts)
    local dap_go = require("dap-go")
    dap_go.setup(opts)

    local dap = require("dap")
    dap.configurations.go = dap.configurations.go or {}

    -- 1. Normal debug of current file (optional)
    table.insert(dap.configurations.go, {
      type = "go",
      name = "Debug File",
      request = "launch",
      program = "${file}",
    })

    -- 2. Attach to Air process running with dlv headless
    table.insert(dap.configurations.go, {
      type = "go",
      name = "Attach to Air",
      request = "attach",
      mode = "remote",
      host = "127.0.0.1",
      port = 2345,
    })
  end,
}
