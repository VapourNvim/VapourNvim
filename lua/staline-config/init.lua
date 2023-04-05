-- Bootstrap: Bail during initialization.
if vim.g.nvim_bootsrapped == 1 then return nil end

require('staline-config.' .. Vapour.plugins.staline.theme)
