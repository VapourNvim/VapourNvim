-- Bootstrap: Bail during initialization.
if vim.g.nvim_bootsrapped == 1 then return nil end

Vapour.utils.plugins.packadd('onedark.vim')
vim.cmd('colorscheme onedark')
Vapour.settings.lualine_colorscheme = 'onedark'
