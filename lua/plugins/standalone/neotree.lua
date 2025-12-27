-- vim.api.nvim_create_autocmd("BufEnter", {
--   group = vim.api.nvim_create_augroup("NeotreeCloseOnLast", { clear = true }),
--   pattern = "neo-tree*",
--   callback = function()
--     if vim.api.nvim_call_function("winlayout", {})[1] == "leaf" and vim.bo.filetype == "neo-tree" then
--       vim.defer_fn(function()
--         vim.cmd("Neotree close")
--       end, 10)
--     end
--   end,
-- })
--

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    popup_border_style = "",
    filesystem = {
      filtered_items = {
        visible = true,
      },
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        vim.cmd("Neotree toggle float filesystem")
      end,
      desc = "Toggle Neo-Tree",
    },
  }
}
