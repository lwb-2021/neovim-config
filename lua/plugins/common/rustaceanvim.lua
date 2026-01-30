return {
  "mrcjkb/rustaceanvim",
  version = "^6", -- Recommended
  lazy = false,   -- This plugin is already lazy
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
        default_settings = {
          ["rust-analyzer"] = {
            cargo = {
              loadOutDirsFromCheck = true,
              buildScripts = {
                enable = true,
              },
            },
            checkOnSave = true,
            procMacro = {
              enable = true,
              ignored = {},
            },
            files = {
              watcher = "client",
              excludeDirs = { ".direnv", ".git" },
            },
          },

        },
      },
    }
  end,
}
