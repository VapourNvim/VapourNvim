-- __     __                           _   _       _
-- \ \   / /_ _ _ __   ___  _   _ _ __| \ | |_   _(_)_ __ ___
--  \ \ / / _` | '_ \ / _ \| | | | '__|  \| \ \ / / | '_ ` _ \
--   \ V / (_| | |_) | (_) | |_| | |  | |\  |\ V /| | | | | | |
--    \_/ \__,_| .__/ \___/ \__,_|_|  |_| \_| \_/ |_|_| |_| |_|
--             |_|
-- Author: https://github.com/hackorum
-- Github: https://github.com/hackorum/VapourNvim
--
-- Sane defaults and global helpers
-- Load all Vapour packages first
require('vapour')
require('vapour.options')

local user_config = CONFIG_PATH .. '/lua/vapour/user-config/init.lua'

if not Vapour.utils.file.exists(user_config) then Vapour.utils.file.create(user_config) end

-- User config that overrides the above
vim.cmd('luafile ' .. user_config)

-- General
require('vapour.plugins')
require('vapour.keybindings')

vim.cmd[[
  packadd nvim-treesitter
  packadd nvim-lspconfig
  packadd nvim-compe
  packadd nvim-autopairs
]]

-- Syntax and Visual
require('colorscheme.onedark')
require('treesitter-config')
require('colorizer-config')
require('galaxyline-config')
require('dashboard-config')

-- LSP and Autocomplete
require('compe-config')
require('autopairs-config')
require('language-servers')
require('gitsigns-config')

-- Terminal Support
require('toggleterm-config')

-- Navigation
require('telescope-config')
require('nvimtree-config')

-- Other
require('dial-config')
require('which-key-config')
require('formatting')
