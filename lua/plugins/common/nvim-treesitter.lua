return {
  "nvim-treesitter/nvim-treesitter",
  -- event = { "File", "VeryLazy" },
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "markdown", "latex",

        "desktop", "kdl", "toml", "yaml",

        "javascript", "typescript",
        "lua", "nix",

        "c", "cpp", "java", "javadoc", "python", "rust",
      },
      highlight = {
        enable = true
      },
      incremental_selection = {
        enable = true
      },
      indent = {
        enable = true
      },
    }
  end
}
