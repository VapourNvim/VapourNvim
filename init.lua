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
require('vapour-globals')
require('options')
require('vapour-utils')

local user_config = CONFIG_PATH .. '/lua/vapour-user-config/init.lua'

if not Vapour.utils.file.exists(user_config) then
  print('User config does not exist, creating empty ' .. user_config)

  local fp, err = io.open(user_config, 'w+')
  assert(fp, err)
  fp:write('')
  fp:close()
end

-- User config that overrides the above
vim.cmd('luafile ' .. user_config)

-- General
require('plugins')
require('keybindings')

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
