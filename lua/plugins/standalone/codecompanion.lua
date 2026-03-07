local siliconflow_api = {
  api_key = "cmd:pass API/SiliconFlow/Completion",
  url = "https://api.siliconflow.cn",
}
local siliconflow_schema = {
  model = {
    default = "Qwen/Qwen3.5-4B"
  }
}

return {
  "olimorris/codecompanion.nvim",
  opts = {
    adapters = {
      http = {
        siliconflow = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = siliconflow_api,
            schema = siliconflow_schema
          })
        end,
      }
    },
    strategies = {
      inline = {
        adapter = {
          name = "siliconflow",
          model = "Qwen/Qwen2.5-Coder-7B-Instruct"
        }
      },
      chat = {
        adapter = {
          name = "siliconflow",
          model = "Qwen/Qwen3.5-4B",
        }
      }
    },
    opts = {
      -- language = "Chinese",
    }
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- "github/copilot.vim"
  },
}
