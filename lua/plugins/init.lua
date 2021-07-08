local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end
vim.cmd [[packadd packer.nvim]]

local packer = require('packer')

packer.init(Vapour.plugins.packer.init)

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    -- Syntax Highlighting and Visual Plugins
    use 'norcalli/nvim-colorizer.lua'
    use 'tjdevries/colorbuddy.nvim'
    use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons', config = "require'bufferline'.setup{}"}
    use {'glepnir/galaxyline.nvim', branch = 'main'}
    use 'glepnir/dashboard-nvim'

    -- Tree-Sitter
    use {'nvim-treesitter/nvim-treesitter', event = 'BufRead,' run = ':TSUpdate'}
    use 'p00f/nvim-ts-rainbow'
    use 'windwp/nvim-ts-autotag'

    -- Colorschemes
    use {'marko-cerovac/material.nvim', requires = 'tjdevries/colorbuddy.nvim'}
    use 'joshdick/onedark.vim'
    use 'gruvbox-community/gruvbox'
    use 'arcticicestudio/nord-vim'

    -- LSP and Autocomplete
    use {'neovim/nvim-lspconfig', event = "BufRead"}
    use 'glepnir/lspsaga.nvim'
    use {'hrsh7th/nvim-compe', event = "InsertEnter"}
    use 'hrsh7th/vim-vsnip'
    use {'windwp/nvim-autopairs', after = "nvim-compe"}

    -- Version Control
    use {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim', config = "require('neogit').setup {}"}
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

    -- Language Specific
    use 'davidgranstrom/nvim-markdown-preview'

    -- Terminal Integration
    use 'akinsho/nvim-toggleterm.lua'

    -- Navigation
    use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
    use {'kyazdani42/nvim-tree.lua', cmd = "NvimTreeToggle"}
    use 'phaazon/hop.nvim'

    -- Other
    use {'terrortylor/nvim-comment', cmd = "CommentToggle", config = "require('nvim_comment').setup()"}
    use 'monaqa/dial.nvim'
    use 'lukas-reineke/format.nvim'
    use {'folke/which-key.nvim', event = "BufWinEnter"}
    
    for _, plugin in pairs(Vapour.plugins.user) do
      use(plugin)
    end
end)
