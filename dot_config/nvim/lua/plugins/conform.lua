-- Add extra options to conform
return {
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- set formatters
  {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      local opts = {
        formatters_by_ft = {
          go = { "gofmt" },
          lua = { "stylua" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
        },
      }
      return opts
    end,
  },
}
