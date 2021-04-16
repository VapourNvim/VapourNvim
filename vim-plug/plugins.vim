" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'sheerun/vim-polyglot'
  Plug 'scrooloose/NERDTree'
  Plug 'jiangmiao/auto-pairs'
  Plug 'joshdick/onedark.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'tpope/vim-commentary'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'
  Plug 'mhinz/vim-startify'
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'
  Plug 'liuchengxu/vim-which-key'
  Plug 'ryanoasis/vim-devicons'
  Plug 'unblevable/quick-scope'
  Plug 'justinmk/vim-sneak'
  Plug 'voldikss/vim-floaterm'
  Plug 'ChristianChiarulli/far.vim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

