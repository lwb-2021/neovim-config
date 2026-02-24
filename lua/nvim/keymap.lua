local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<leader>c", function() vim.b.completion = not vim.b.completion end, { desc = "Toggle completion" })
-- map("n", "<leader>q", "bwipeout", { desc = "Close Buffer" })
