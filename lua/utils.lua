Utils = {
  get_pkg_path = function(pkg, path, nix)
    if not vim.g.nix then
      require('mason-registry')
      return vim.fn.expand "$MASON/packages" .. "/" .. pkg
          .. path
    end
    return nix .. path
  end
}
