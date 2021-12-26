local lualine = Vapour.utils.plugins.require('lualine')
lualine.setup {
  options = {
    theme = Vapour.settings.lualine_colorscheme,
    section_separators = {left = '', right = ''},
    component_separators = {left = '', right = ''}
  },
  extensions = {'nvim-tree', 'toggleterm'}
}
