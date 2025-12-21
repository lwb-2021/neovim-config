local function init_lazy()
  -- Bootstrap lazy.nvim
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out,                            "WarningMsg" },
        { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
    end
  end
  vim.opt.rtp:prepend(lazypath)
end

local function init_lazy_in_nix()
  vim.opt.rtp:prepend([[lazy.nvim-plugin-path]])
end

spec = {
  { import = "plugins.common" }
}

if not vim.g.vscode then
  spec[2] = { import = "plugins.standalone" }
end
if not vim.g.nix then
  spec[3] = { import = "plugins.nonnix" }
  init_lazy()
else
  init_lazy_in_nix()
end

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- Setup lazy.nvim
require("lazy").setup({
  spec = spec,
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "catppuccin-mocha" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
  performance = { rtp = { reset = not vim.g.nix } }
})
