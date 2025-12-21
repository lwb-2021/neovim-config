require("nvim.options")
require("nvim.keymap")

if not vim.g.vscode then
  require("nvim.lsp")
end

require("lazy-nvim")



vim.cmd.colorscheme "catppuccin-mocha"
