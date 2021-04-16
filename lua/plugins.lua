local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}
    use 'kyazdani42/nvim-tree.lua'
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'hrsh7th/nvim-compe'
    use 'hrsh7th/vim-vsnip'
    use 'windwp/nvim-autopairs'
    use 'ChristianChiarulli/nvcode-color-schemes.vim'
    use {'dracula/vim', as = 'dracula'}
    use {'glepnir/galaxyline.nvim', branch = 'main', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    use 'akinsho/nvim-bufferline.lua'
    use 'norcalli/nvim-colorizer.lua'
    use 'terrortylor/nvim-comment'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'p00f/nvim-ts-rainbow'
    use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
    use 'TimUntersberger/neogit'
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'alvan/vim-closetag'
    use 'RRethy/vim-illuminate'
    use 'monaqa/dial.nvim'
    use 'phaazon/hop.nvim'
    use 'andymass/vim-matchup'
    use 'glepnir/dashboard-nvim'
    use 'voldikss/vim-floaterm'
    use 'liuchengxu/vim-which-key'
    -- use {'stsewd/isort.nvim', run = ':UpdateRemotePlugins'}
    -- use 'drinksober/nvim-yapf-formater'
end)
