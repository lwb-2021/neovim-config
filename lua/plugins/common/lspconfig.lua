local lsp = {
  "lua_ls",
  "nil_ls",

  "eslint",
  "vtsls",
  "vue_ls",

  "rust_analyzer",

  "pylsp",
}
return {
  "neovim/nvim-lspconfig",
  config = function()
    local vue_language_server_path = [[lsp.vue-language-server]] .. '/vue-language-server'
        .. '/node_modules/@vue/language-server'

    if not vim.g.nix then
      local mason_registry = require('mason-registry')
      vue_language_server_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server'
          .. '/node_modules/@vue/language-server'
    end

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

    --[[
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
        ]]
    vim.lsp.config('vtsls', vtsls_config)
    vim.lsp.config('vue_ls', vue_ls_config)
    -- vim.lsp.config('rust_analyzer', rust_analyzer_config)

    vim.lsp.enable(lsp, vim.g.nix)
  end,
  dependencies = {
    {
      "mason-org/mason.nvim",
      enabled = not vim.g.nix,
      opts = {
        ensure_installed = lsp,
      }
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
