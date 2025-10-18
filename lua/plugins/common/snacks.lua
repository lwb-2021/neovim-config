return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  --- @type snacks.Config
  opts = {
    bigfile = { enabled = true },
    --- @class snacks.dashboard.Config
    --- @field enabled? boolean
    --- @field sections snacks.dashboard.Section
    --- @field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>
    dashboard = {
      enabled = true,
      preset = {
        ---@type fun(cmd:string, opts:table)|nil
        pick = nil,
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      explorer = { enabled = false },
      indent = { enabled = true },
      input = { enabled = true },
      lazygit = { enabled = true },
      picker = { enabled = false },
      notifier = { enabled = false },
      quickfile = { enabled = true },
      rename = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
}
