return {
  -- "nvim-telescope/telescope-file-browser.nvim",
  -- dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  -- config = function(plugin, opts)
  --   retuire("plugins.configs.telescope")(plugin, opts)
  --
  --   local telescope = require("telescope")
  --   telescope.setup {
  --     extensions = {
  --       file_browser = {
  --         -- disables netrw and use telescope-file-browser in its place
  --         hijack_netrw = true,
  --       },
  --     },
  --   }
  --   -- To get telescope-file-browser loaded and working with telescope,
  --   -- you need to call load_extension, somewhere after setup function:
  --   telescope.load_extension "file_browser"
  -- end,

  "nvim-telescope/telescope.nvim",
  dependencies = { -- add a new dependency to telescope that is our new plugin
    "nvim-telescope/telescope-file-browser.nvim",
  },
  -- the first parameter is the plugin specification
  -- the second is the table of options as set up in Lazy with the `opts` key
  config = function(plugin, opts)
    -- run the core AstroNvim configuration function with the options table
    require("plugins.configs.telescope")(plugin, opts)

    -- require telescope and load extensions as necessary
    local telescope = require "telescope"
    telescope.load_extension "file_browser"
  end,

  -- "nvim-telescope/telescope-file-browser.nvim",
  -- after = "telescope.nvim",
  -- config = function() require("telescope").load_extension "file_browser" end,
}

