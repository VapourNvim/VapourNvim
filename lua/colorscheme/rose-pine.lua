-- Bootstrap: Bail during initialization.
if vim.g.nvim_bootsrapped == 1 then return nil end

Vapour.utils.plugins.packadd('rose-pine')
require('rose-pine').setup({disable_italics = true})
vim.cmd('colorscheme rose-pine')
Vapour.settings.lualine_colorscheme = "rose-pine"
