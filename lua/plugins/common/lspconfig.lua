return {
  "neovim/nvim-lspconfig",

  dependencies = {
    {
      "mason-org/mason.nvim",
      enabled = not vim.g.nix,
      opts = function()
        local lsp = {}
        for name, _ in pairs(LspConfig) do
          table.insert(lsp, name)
        end
        return {
          ensure_installed = lsp,
        }
      end
    },
    {
      "mason-org/mason-lspconfig.nvim",
      enabled = not vim.g.nix,
      opts = {
        automatic_enable = true,
      },
    },

  },
}
