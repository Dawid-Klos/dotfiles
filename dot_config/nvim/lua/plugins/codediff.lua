return {
  "esmuellert/codediff.nvim",
  cmd = "CodeDiff",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },

  keys = {
    { "<leader>gd", "<cmd>CodeDiff<cr>", desc = "Open CodeDiff" },
  },

  opts = {
    -- Better visuals for most dark themes
    highlights = {
      line_insert = "DiffAdd",
      line_delete = "DiffDelete",

      -- Let plugin auto-derive char highlight brightness
      char_insert = nil,
      char_delete = nil,
      char_brightness = 1.3, -- Slightly stronger for dark themes

      -- Conflict signs integrate nicely with LazyVim + GitSigns
      conflict_sign = "DiagnosticSignWarn",
      conflict_sign_resolved = "Comment",
      conflict_sign_accepted = "GitSignsAdd",
      conflict_sign_rejected = "GitSignsDelete",
    },

    diff = {
      disable_inlay_hints = true, -- important if using lsp-inlayhints
      max_computation_time_ms = 5000,
      ignore_trim_whitespace = true, -- usually what you want in Git diffs
      hide_merge_artifacts = true,
      original_position = "left", -- matches git + vimdiff convention
      conflict_ours_position = "right",
      cycle_next_hunk = true,
    },

    explorer = {
      position = "left",
      width = 35,
      indent_markers = true,
      initial_focus = "explorer",
      view_mode = "tree",
      icons = {
        folder_closed = "",
        folder_open = "",
      },
      file_filter = {
        ignore = {
          "*.lock",
          "dist/*",
          "node_modules/*",
        },
      },
    },

    history = {
      position = "bottom",
      height = 15,
      initial_focus = "history",
      view_mode = "list",
    },

    keymaps = {
      view = {
        quit = "q",
        toggle_explorer = "<leader>e", -- feels more natural in LazyVim
        next_hunk = "]c",
        prev_hunk = "[c",
        next_file = "]f",
        prev_file = "[f",
        diff_get = "do",
        diff_put = "dp",
        open_in_prev_tab = "gf",
        toggle_stage = "-",
      },

      explorer = {
        select = "<CR>",
        hover = "K",
        refresh = "R",
        toggle_view_mode = "i",
        stage_all = "S",
        unstage_all = "U",
        restore = "X",
      },

      history = {
        select = "<CR>",
        toggle_view_mode = "i",
      },

      conflict = {
        accept_incoming = "<leader>ct",
        accept_current = "<leader>co",
        accept_both = "<leader>cb",
        discard = "<leader>cx",
        next_conflict = "]x",
        prev_conflict = "[x",
        diffget_incoming = "2do",
        diffget_current = "3do",
      },
    },
  },
}
