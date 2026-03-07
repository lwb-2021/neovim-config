return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    -- language server
    { "gd",          function() Snacks.picker.lsp_definitions() end,  desc = "Goto definition" },
    { "gD",          function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "gr",          function() Snacks.picker.lsp_references() end,   desc = "References",      nowait = true },

    -- picker
    { "<leader>ff",  function() Snacks.picker.smart() end,            desc = "Smart find files" },
    { "<leader>fg",  function() Snacks.picker.grep() end,             desc = "Live grep" },

    -- gh
    { "<leader>ghi", function() Snacks.picker.gh_issue() end },

    -- git
    { "<leader>gg",  function() Snacks.lazygit() end,                 desc = "Lazygit" },

    -- terminal
    { "<leader>t",   function() Snacks.terminal() end,                desc = "Toggle terminal" },
  },
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
    },
    explorer = { enabled = false },
    gh = { enabled = true },
    image = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = false },
    quickfile = { enabled = true },
    rename = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    terminal = { enabled = true },
    words = { enabled = true },
  },
}
