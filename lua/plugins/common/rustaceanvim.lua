return {
  "mrcjkb/rustaceanvim",
  version = "^7",
  lazy = false,
  config = function()
    vim.g.rustaceanvim = {
      server = {
        auto_attach = function(bufnr)
          vim.api.nvim_create_autocmd("User", {
            pattern = { "DirenvReady", "DirenvNotFound" },
            once = true,
            callback = function()
              require("rustaceanvim.lsp").start(bufnr)
            end
          })
        end,
      },
    }
  end,
}
