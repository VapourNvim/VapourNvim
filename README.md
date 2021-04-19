![VapourNvim Logo](assets/logo.jpg)
![VapourNvim Logo](assets/screenshot.jpg)

## Introduction

The goal of this project is to simply *get work done* quickly.

This project is built to be:
* **Functional**. The core of an ideal IDE is functionality. It will *not* be compromised for minimalism.
* **Minimal**. Too many plugins can affect startup time. Time is not to be wasted for opening files!

## Features

* A very elegant and clean look to the editor.
* An extensible package management system.
* Written in an efficient programming language.
* Great support for version control.
* Code completion.
* Language support(LSP).
* Autoformatting.
* Faster navigation with telescope and hop.nvim.
* Better syntax highlighting with treesitter.
* Terminal integration so that you don't need to hop between different tabs or windows.


## Requirements

* [Neovim 0.5](https://github.com/neovim/neovim/releases/tag/nightly) - Required - For lua configuration
* [Lazygit](https://github.com/jesseduffield/lazygit) - Optional - For git integration
* [Pandoc](https://github.com/jgm/pandoc) - Optional - For markdown preview

## Installation

```bash
git clone https://github.com/hackorum/VapourNvim ~/.config/nvim
nvim
:PackerSync
```
## Plugins included

* norcalli/nvim-colorizer.lua
* tjdevries/colorbuddy.nvim
* akinsho/nvim-bufferline.lua
* glepnir/dashboard-nvim
* nvim-treesitter/nvim-treesitter
* p00f/nvim-ts-rainbow
* windwp/nvim-ts-autotag
* marko-cerovac/material.nvim
* joshdick/onedark.vim
* gruvbox-community/gruvbox
* arcticicestudio/nord-vim
* neovim/nvim-lspconfig
* glepnir/lspsaga.nvim
* hrsh7th/nvim-compe
* hrsh7th/vim-vsnip
* windwp/nvim-autopairs
* kdheepak/lazygit.nvim
* TimUntersberger/neogit
* lewis6991/gitsigns.nvim
* nvim-lua/plenary.nvim
* davidgranstrom/nvim-markdown-preview
* akinsho/nvim-toggleterm.lua
* nvim-telescope/telescope.nvim
* nvim-lua/popup.nvim
* kyazdani42/nvim-tree.lua
* kyazdani42/nvim-web-devicons
* phaazon/hop.nvim
* terrortylor/nvim-comment
* monaqa/dial.nvim
* lukas-reineke/format.nvim

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the GPL-3.0 license.
