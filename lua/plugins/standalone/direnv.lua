return {
  "actionshrimp/direnv.nvim",
  opts = {
    async = true,
    on_direnv_finished = function()
      -- You probably also want to pair this with `autostart = false` in any `lspconfig` calls - see 'LSP config examples' below!
      for name, _ in pairs(LspConfig) do
        if name ~= "*" then
          vim.lsp.enable(name)
        end
      end
    end
  }
}
