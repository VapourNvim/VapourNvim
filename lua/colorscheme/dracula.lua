-- Bootstrap: Bail during initialization.
if vim.g.nvim_bootsrapped == 1 then return nil end

Vapour.utils.plugins.packadd('dracula')
vim.cmd [[colorscheme dracula]]
Vapour.settings.lualine_colorscheme = 'dracula'
