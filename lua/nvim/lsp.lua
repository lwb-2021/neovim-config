LspConfig = {
  ["*"] = {
    capabilities = {
      workspace = {
        fileOperations = {
          didRename = true,
          willRename = true,
        },
      },
    },
    keys = {
    },
  },

  lua_ls = {},
  nil_ls = {},

  eslint = {},
  vtsls = {
    settings = {
      vtsls = {
        tsserver = {
          globalPlugins = {
            {
              name = "@vue/typescript-plugin",
              location = Utils.get_pkg_path("vue-language-server",
                "/node_modules/@vue/language-server", [[lsp.vue-language-server]]),
              languages = { "vue" },
              configNamespace = "typescript"
            }
          },
          filetypes = {
            "typescript", "javascript", "javascriptreact", "typescriptreact", "vue"
          }
        },
      },
    },
  },
  vue_ls = {},

  slint_lsp = {},

  rust_analyzer = {}, -- for installing, not enabled actually

  ["rust-analyzer"] = {
    settings = {
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
  },


  pylsp = {},
}

vim.diagnostic.config {
  virtual_text = {
    enabled = true,
    prefix = "●",
    spacing = 4,
    severity_limit = "W",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}

for name, config in pairs(LspConfig) do
  if name ~= "*" and name ~= "rust_analyzer" then
    vim.lsp.enable(name)
  end

  if config then
    vim.lsp.config(name, config)
  end
end
