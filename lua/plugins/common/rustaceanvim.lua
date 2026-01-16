return {
  "mrcjkb/rustaceanvim",
  version = "^6", -- Recommended
  lazy = false,   -- This plugin is already lazy
  config = function()
    vim.g.rustaceanvim.server.default_settings["rust-analyzer"] = {
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
    }
  end,
}
