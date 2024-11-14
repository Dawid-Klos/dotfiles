-- tailwind-tools.lua
return {
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  keys = function()
    return {
      { "<leader>ts", "<cmd>TailwindSort<CR>", desc = "Sort Tailwind Classes" },
      { "<leader>te", "<cmd>TailwindColorEnable<CR>", desc = "Enable Tailwind Colors" },
    }
  end,
  opts = {}, -- your configuration
}
