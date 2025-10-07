return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    automatic_enable = true,
    ensure_installed = {
      "lua_ls",
      "nil_ls",

      "eslint_lsp",
      "ts_ls",
      "vue_ls",

      "pylsp",
    },
  },
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
      }
    },
    "neovim/nvim-lspconfig",
  },
}
