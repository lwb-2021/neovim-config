vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

if vim.fn.has("linux") then
  vim.opt.shell = "fish"
elseif vim.fn.has("windows") then
  vim.opt.shell = "powershell"
end

vim.o.winborder = "rounded"

vim.g.neovide_opacity = 0.8
vim.g.neovide_normal_opacity = 0.8
