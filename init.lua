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

local user_config = CONFIG_PATH .. '/lua/vapour/user-config/init.lua'

if not Vapour.utils.file.exists(user_config) then Vapour.utils.file.create(user_config) end

-- User config that overrides the above
vim.cmd('luafile ' .. user_config)

-- General
require('vapour.options')
require('vapour.plugins')
require('vapour.keybindings')

-- Syntax and Visual
-- If a custom theme is wanted, require() that in user-config.init
-- Otherwise if the default theme is not wanted change Vapour.settings.colorscheme
-- This will return nil if it's not found
Vapour.utils.plugins.require('colorscheme.' .. Vapour.settings.colorscheme)

-- LSP and Autocomplete
require('language-servers')
require('gitsigns-config')

-- Terminal Support
-- require('toggleterm-config')

-- Other
require('which-key-config')
