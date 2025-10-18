return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    automatic_enable = true,
    ensure_installed = {
      "lua_ls",
      "nil_ls",

      "eslint",
      "vtsls",
      "vue_ls",

      "rust_analyzer",

      "pylsp",
    },
  },
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
      }
    },
    {
      "neovim/nvim-lspconfig",
      config = function()
        local mason_registry = require('mason-registry')
        local vue_language_server_path = vim.fn.expand '$MASON/packages' ..
            '/vue-language-server' .. '/node_modules/@vue/language-server'
        local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
        local vue_plugin = {
          name = '@vue/typescript-plugin',
          location = vue_language_server_path,
          languages = { 'vue' },
          configNamespace = 'typescript',
        }
        local vue_ls_config = {}

        local vtsls_config = {
          settings = {
            vtsls = {
              tsserver = {
                globalPlugins = {
                  vue_plugin,
                },
              },
            },
          },
          filetypes = tsserver_filetypes,
        }

        --local ts_ls_config = {
        --init_options = {
        --  plugins = {
        --    vue_plugin,
        --  },
        --},
        --filetypes = tsserver_filetypes,
        --}

        local rust_analyzer_config = {
          imports = {
            granularity = {
              group = "module",
            },
            prefix = "self",
          },
          cargo = {
            buildScripts = {
              enable = true,
            },
          },
          procMacro = {
            enable = true
          },
        }
        vim.lsp.config('vtsls', vtsls_config)
        vim.lsp.config('vue_ls', vue_ls_config)
        -- vim.lsp.config('ts_ls', ts_ls_config)
        vim.lsp.config('rust_analyzer', rust_analyzer_config)
      end
    }
  },
}
