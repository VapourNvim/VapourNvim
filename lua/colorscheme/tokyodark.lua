-- Bootstrap: Bail during initialization.
if vim.g.nvim_bootsrapped == 1 then return nil end

Vapour.utils.plugins.packadd('tokyodark.nvim')
vim.cmd('colorscheme tokyodark')
Vapour.settings.lualine_colorscheme = "tokyodark"
