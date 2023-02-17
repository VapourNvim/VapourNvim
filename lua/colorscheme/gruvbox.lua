-- Bootstrap: Bail during initialization.
if vim.g.nvim_bootsrapped == 1 then return nil end

Vapour.utils.plugins.packadd('gruvbox')
vim.g.gruvbox_contrast_dark = 'hard'
vim.cmd('colorscheme gruvbox')
Vapour.settings.lualine_colorscheme = 'gruvbox'
