return {
  "AstroNvim/astrocommunity",

  -- lsp start
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.python" },

  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.toml" },

  -- Enables either denols or tsserver based on the projec
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.html-css" },
  -- lsp end

  -- editing enhance start
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  -- editing enhance end

  -- ui start
  { import = "astrocommunity.bars-and-lines.heirline-vscode-winbar" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  {
    "catppuccin",
    opts = {
      integrations = {
        nvimtree = false,
        aerial = true,
        dap = { enabled = true, enable_ui = true },
        mason = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        symbols_outline = true,
        telescope = true,
        which_key = true,
      }
    },
  },
  -- ui end


  -- utility start
  { import = "astrocommunity.utility.noice-nvim" },
  -- utility end
}
