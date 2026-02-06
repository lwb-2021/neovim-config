return {
  "mrcjkb/rustaceanvim",
  version = "^7",
  ft = { "rust" },
  config = function()
    vim.g.rustaceanvim = {
      server = {
        auto_attach = function(bufnr)
          vim.api.nvim_create_autocmd("User", {
            pattern = { "DirenvReady", "DirenvNotFound" },
            once = true,
            callback = function()
              if vim.bo.filetype == "rust" then
                require("rustaceanvim.lsp").start(bufnr)
              end
            end,
          })
          return false
        end,
      },
    }
  end,
}
