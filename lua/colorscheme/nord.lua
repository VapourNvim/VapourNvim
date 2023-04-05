-- Bootstrap: Bail during initialization.
if vim.g.nvim_bootsrapped == 1 then return nil end

Vapour.utils.plugins.packadd('nord.nvim')
require('nord').set()
Vapour.settings.lualine_colorscheme = 'nord'
