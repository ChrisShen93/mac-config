return {
  "nvim-treesitter/nvim-treesitter",
  config = function(plugin, opts)
    require("plugins.configs.nvim-treesitter")(plugin, {
      ensure_installed = {
        "c",
        "lua",
        "vim",
      },
    })
  end,
}
