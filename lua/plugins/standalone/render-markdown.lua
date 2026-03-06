return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  ft = { "markdown", "codecompanion" },
  opts = {
    render_modes = { "n", "c", "t" },
    file_types = { "markdown", "codecompanion" },
    completions = { blink = { enabled = true } }
  }
}
