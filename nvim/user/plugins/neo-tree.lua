return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "s1n7ax/nvim-window-picker",
    config = function()
      require'window-picker'.setup({
        autoselect_one = true,
        include_current = false,
        selection_chars = 'ABCDEFGHIJKLMN',
        filter_rules = {
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { 'neo-tree', "neo-tree-popup", "notify" },

            -- if the buffer type is one of following, the window will be ignored
            buftype = { 'terminal', "quickfix" },
          },
        },
        -- other_win_hl_color = '#e35e4f',
      })
    end,
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      }
    },
    window = {
      auto_expand_width = true,
      mappings = {
        ["o"] = "open_with_window_picker",
        ["s"] = "split_with_window_picker",
        ["S"] = "split_with_window_picker",
        ["-"] = "split_with_window_picker",
        ["|"] = "vsplit_with_window_picker",
      }
    }
  }
}

