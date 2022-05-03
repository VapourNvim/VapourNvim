local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute 'packadd packer.nvim'
end

local packer = Vapour.utils.plugins.require('packer')

packer.init(Vapour.plugins.packer.init)

local function is_enabled(plugin)
  return Vapour.plugins[plugin].enabled
end

local function get_cmp()
  if Vapour.plugins.lsp.enabled == true then
    return 'nvim-cmp'
  else
    return
  end
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Syntax Highlighting and Visual Plugins
  use {
    'norcalli/nvim-colorizer.lua',
    disable = not is_enabled('colorizer'),
    config = "require'colorizer-config'",
    event = 'BufRead'
  }
  use {
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = 'require"bufferline-config"',
    disable = not is_enabled('bufferline'),
    event = 'BufRead'
  }
  use {
    'tamton-aquib/staline.nvim',
    disable = not is_enabled('staline'),
    config = "require'staline-config'",
    event = 'BufRead'
  }
  use {
    'glepnir/dashboard-nvim',
    disable = not is_enabled('dashboard'),
    config = "require'dashboard-config'",
    event = 'BufWinEnter'
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    disable = not is_enabled('indent_blankline'),
    config = "require'blankline-config'",
    event = "BufRead"
  }
  use {
    "folke/zen-mode.nvim",
    config = 'require("zen-mode-config")',
    disable = not is_enabled('zen_mode')
  }
  use {
    "folke/twilight.nvim",
    config = "require('twilight-config')",
    disable = not is_enabled('twilight')
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    disable = not is_enabled('gitsigns'),
    event = 'BufRead',
    config = "require('gitsigns-config')"
  }
  use { 'kyazdani42/nvim-web-devicons', event = 'BufRead' }

  -- Tree-Sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufWinEnter',
    run = ':TSUpdate',
    disable = not is_enabled('treesitter'),
    config = "require'treesitter-config'"
  }
  use { 'p00f/nvim-ts-rainbow', disable = not is_enabled('treesitter'), after = 'nvim-treesitter' }
  use { 'windwp/nvim-ts-autotag', disable = not is_enabled('treesitter'), after = 'nvim-treesitter' }
  use {
    'RRethy/nvim-treesitter-endwise',
    disable = not is_enabled('treesitter'),
    after = 'nvim-treesitter'
  }
  use {
    'RRethy/nvim-treesitter-textsubjects',
    disable = not is_enabled('treesitter'),
    after = 'nvim-treesitter'
  }

  -- Colorschemes
  use { 'rose-pine/neovim', as = 'rose-pine', opt = true }
  use { 'joshdick/onedark.vim', opt = true }
  use { 'gruvbox-community/gruvbox', opt = true }
  use { 'shaunsingh/nord.nvim', opt = true }
  use { 'folke/tokyonight.nvim', opt = true }
  use { 'dracula/vim', as = 'dracula', opt = true }
  use { 'tiagovla/tokyodark.nvim', opt = true }
  use { 'catppuccin/nvim', as = 'catppuccin', opt = true }

  -- LSP and Autocomplete
  use { 'neovim/nvim-lspconfig', event = "BufRead", disable = not is_enabled('lsp') }
  use { 'williamboman/nvim-lsp-installer', disable = not is_enabled('lsp') }
  use { 'onsails/lspkind-nvim', disable = not is_enabled('lsp') }
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require 'cmp-config'
    end,
    disable = not is_enabled('lsp')
  }
  use { 'hrsh7th/cmp-nvim-lsp', disable = not is_enabled('lsp') }
  use { 'hrsh7th/cmp-buffer', after = "nvim-cmp", disable = not is_enabled('lsp') }
  use { 'hrsh7th/cmp-path', after = "nvim-cmp", disable = not is_enabled('lsp') }
  use { 'hrsh7th/cmp-vsnip', after = "nvim-cmp", disable = not is_enabled('lsp') }
  use { 'hrsh7th/vim-vsnip', disable = not is_enabled('lsp'), after = "nvim-cmp" }
  use {
    'windwp/nvim-autopairs',
    after = get_cmp(),
    config = "require'autopairs-config'",
    disable = not is_enabled('autopairs')
  }
  use { "b0o/schemastore.nvim", after = 'nvim-lsp-installer', disable = not is_enabled('lsp') }

  -- Terminal Integration
  use {
    'akinsho/nvim-toggleterm.lua',
    disable = not is_enabled('toggleterm'),
    config = 'require"toggleterm-config"'
  }

  -- Navigation
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', disable = not is_enabled('lsp') }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
    cmd = "Telescope",
    disable = not is_enabled('telescope'),
    config = "require'telescope-config'"
  }
  use {
    'kyazdani42/nvim-tree.lua',
    cmd = "NvimTreeToggle",
    disable = not is_enabled('nvim_tree'),
    config = "require'nvimtree-config'"
  }

  -- Other
  use {
    'terrortylor/nvim-comment',
    cmd = "CommentToggle",
    config = "require('nvim_comment').setup()",
    disable = not is_enabled('nvim_comment')
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    disable = not is_enabled('null_ls'),
    config = "require'null-ls-config'"
  }
  use { 'folke/which-key.nvim', event = "BufWinEnter" }
  use {
    'andweeb/presence.nvim',
    event = "BufRead",
    config = 'require("presence-config")',
    disable = not is_enabled('presence')
  }

  for _, plugin in pairs(Vapour.plugins.user) do use(plugin) end
end)
