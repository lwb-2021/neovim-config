return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
  },
  init = function()
    local map = vim.keymap.set
    local builtin = require("telescope.builtin")
    local extensions = require("telescope").extensions
    map("n", "<C-S-p>", builtin.commands, { desc = "Command Panel" })
    map("n", "<C-p>", builtin.find_files, { desc = "Telescope find files" })

    map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
  end,
}
