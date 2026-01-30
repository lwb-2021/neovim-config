local grammars = {
  "markdown", "latex",

  "desktop", "kdl", "toml", "yaml",

  "slint",

  "javascript", "typescript",
  "lua", "nix",

  "c", "cpp", "java", "javadoc", "python", "rust",
}

return {
  "MeanderingProgrammer/treesitter-modules.nvim",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
      lazy = false,
      build = ":TSUpdate",
    },
  },
  ---@module "treesitter-modules"
  ---@type ts.mod.UserConfig
  opts = {
    ensure_installed = grammars,
    highlight = {
      enable = true,
      -- setting this to true will run `:h syntax` and tree-sitter at the same time
      -- set this to `true` if you depend on "syntax" being enabled
      -- using this option may slow down your editor, and duplicate highlights
      -- instead of `true` it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    indent = {
      enable = true,
    },
  },
}
