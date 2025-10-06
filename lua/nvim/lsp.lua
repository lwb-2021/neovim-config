vim.diagnostic.config {
  virtual_text = {
    enabled = true,
    prefix = "●",
    spacing = 4,
    severity_limit = "W",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}
