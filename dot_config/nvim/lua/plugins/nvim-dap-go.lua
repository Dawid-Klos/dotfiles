return {
  "leoluz/nvim-dap-go",
  dependencies = { "mfussenegger/nvim-dap" },
  ft = "go",
  opts = function(_, opts)
    local dap_go = require("dap-go")
    dap_go.setup(opts)

    local dap = require("dap")

    -- 🧹 Define once (no duplicates)
    dap.configurations.go = {
      {
        type = "go",
        name = "Delve: Debug File",
        request = "launch",
        program = "${file}",
        buildFlags = "-gcflags='all=-N -l'",
      },
      {
        type = "go",
        name = "Delve: Debug Package",
        request = "launch",
        program = "${workspaceFolder}",
        buildFlags = "-gcflags='all=-N -l'",
      },
      {
        type = "go",
        name = "Delve: Attach to Air",
        request = "attach",
        mode = "remote",
        host = "127.0.0.1",
        port = 2345,
      },
    }
  end,
}
