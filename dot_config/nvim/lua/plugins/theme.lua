-- # Transparent Tokyonight
-- return {
--   "folke/tokyonight.nvim",
--   opts = {
--     transparent = true,
--     styles = {
--       sidebars = "transparent",
--       floats = "transparent",
--     },
--   },
-- }
-- # Transparent Catppuccin
-- return {
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin",
--     },
--   },
--   {
--     "catppuccin",
--     opts = {
--       transparent_background = true,
--     },
--   },
-- }
-- lua/plugins/rose-pine.lua
return {
  "rose-pine/neovim",
  name = "rose-pine",
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
  config = function()
    vim.cmd("colorscheme rose-pine")
  end,
}
