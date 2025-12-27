local function char_count()
  return tostring(vim.fn.wordcount().chars)
end

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "catppuccin",
      component_separators = '',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_z = { "location", char_count },
    }
  }
}
