-- Bootstrap: Bail during initialization.
if vim.g.nvim_bootsrapped == 1 then return nil end

Vapour.utils.plugins.packadd('tokyonight.nvim')
vim.g.tokyonight_style = "night"
vim.cmd [[colorscheme tokyonight]]
Vapour.settings.lualine_colorscheme = 'tokyonight'
