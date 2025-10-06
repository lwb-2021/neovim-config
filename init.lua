require("nvim.options")
require("nvim.keymap")
    -- this is equivalent to setup({}) function

if not vim.g.vscode then
  require("nvim.lsp")
end

require("lazy-nvim")



vim.cmd.colorscheme "catppuccin-mocha"
