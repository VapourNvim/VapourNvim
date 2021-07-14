local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

local packer = Vapour.utils.plugins.require('packer')

packer.init(Vapour.plugins.packer.init)

local function is_enabled(plugin)
  return Vapour.plugins[plugin].enabled
end

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    -- Syntax Highlighting and Visual Plugins
    use {'norcalli/nvim-colorizer.lua', disable = not is_enabled('colorizer')}
    use {'tjdevries/colorbuddy.nvim', disable = not is_enabled('colorbuddy')}
    use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons', config = "require'bufferline'.setup{}", disable = not is_enabled('bufferline')}
    use {'glepnir/galaxyline.nvim', branch = 'main', disable = not is_enabled('galaxyline')}
    use {'glepnir/dashboard-nvim', disable = not is_enabled('dashboard')}

    -- Tree-Sitter
    use {'nvim-treesitter/nvim-treesitter', event = 'BufRead', run = ':TSUpdate', disable = not is_enabled('treesitter')}
    use {'p00f/nvim-ts-rainbow', disable = not is_enabled('treesitter_rainbow')}
    use {'windwp/nvim-ts-autotag', disable = not is_enabled('treesitter_autotag')}

    -- Colorschemes
    use {'marko-cerovac/material.nvim', requires = 'tjdevries/colorbuddy.nvim'}
    use 'joshdick/onedark.vim'
    use 'gruvbox-community/gruvbox'
    use 'arcticicestudio/nord-vim'

    -- LSP and Autocomplete
    use {'neovim/nvim-lspconfig', event = "BufRead"}
    use 'glepnir/lspsaga.nvim'
    use {'hrsh7th/nvim-compe', event = "InsertEnter *", config = function() require'compe-config' end}
    use {'hrsh7th/vim-vsnip', disable = not is_enabled('vsnip')}
    use {'windwp/nvim-autopairs', after = {'nvim-compe'}}

    -- Version Control
    use {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim', config = "require('neogit').setup {}"}
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

    -- Language Specific
    use {'davidgranstrom/nvim-markdown-preview', disable = not is_enabled('markdown_preview')}

    -- Terminal Integration
    use 'akinsho/nvim-toggleterm.lua'

    -- Navigation
    use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}, disable = not is_enabled('telescope')}
    use {'kyazdani42/nvim-tree.lua', cmd = "NvimTreeToggle", disable = not is_enabled('nvim_tree')}
    use 'phaazon/hop.nvim'

    -- Other
    use {'terrortylor/nvim-comment', cmd = "CommentToggle", config = "require('nvim_comment').setup()", disable = not is_enabled('nvim_comment')}
    use {'monaqa/dial.nvim', disable = not is_enabled('dial')}
    use {'lukas-reineke/format.nvim', disable = not is_enabled('format')}
    use {'folke/which-key.nvim', event = "BufWinEnter"}

    for _, plugin in pairs(Vapour.plugins.user) do
      use(plugin)
    end
end)
