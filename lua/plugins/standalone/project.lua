return {
  "coffebar/neovim-project",
  keys = {

    {
      "<leader>p",
      function()
        vim.cmd("NeovimProjectHistory")
      end,
      mode = { "n" },
      desc = "Projects"
    },
  },
  opts = {
    projects = { -- define project roots
      "~/NixOS-Configuration",
      "~/Workspace/*/*",
      "~/.config/*",
    },
    picker = {
      type = "telescope", -- one of "telescope", "fzf-lua", or "snacks"
    }
  },
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
}
