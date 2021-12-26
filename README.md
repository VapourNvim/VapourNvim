<div align="center">
  <h1 align="center">VapourNvim</h1> 
	<a href="https://github.com/hackorum/VapourNvim/#features">✨ Features</a>
  <span> • </span>
	<a href="https://github.com/hackorum/VapourNvim/#installation">📦 Installation</a>
  <span> • </span>
	<a href="https://github.com/hackorum/VapourNvim/wiki">📚 Wiki</a>
  <span> • </span>
	<a href="https://github.com/hackorum/VapourNvim/wiki/Screenshots">📷 Screenshots</a>
  <p></p>
</div>


![VapourNvim Image](https://raw.githubusercontent.com/VapourNvim/VapourNvim/main/assets/screenshot.png)

## Introduction

The goal of this project is to simply *get work done* quickly.

This project is built to be:
* **Functional**. The core of an ideal IDE is functionality. If there is anything you want to add, please consider contributing
* **Minimal**. VapourNvim gives you what you need. Not too much, not too less.
* **Fast**. VapourNvim loads as smooth as butter with an optimum amount of plugins and lazy loading.
* **Easy to Configure**. If there's anything extra that you want to add or something you'd like to tweak, VapourNvim has an awesome [configuration system](https://github.com/hackorum/VapourNvim/wiki/User-Configuration) built in. 

## Features

* Easy to install and use
* Written in an efficient programming language
* Extensible package management system
* Very elegant and clean look
* Beautiful syntax highlighting with treesitter
* Language support and Code Autocompletion
* Great support for version control
* Terminal integration
* Efficient file navigation
* Autoformatting
* Awesome user configuration system


## Requirements

* [Neovim Version > 0.5](https://github.com/neovim/neovim/releases/tag/v0.5.0) - Required - For lua configuration
* [NodeJS](https://nodejs.org) - Required - For LSP
* [Lazygit](https://github.com/jesseduffield/lazygit) - Optional - For git integration
* [RipGrep](https://github.com/BurntSushi/ripgrep) - Optional - For telescope live grep

## Installation

Make sure you have curl and bash installed before you run this script.

```bash
curl -s https://raw.githubusercontent.com/VapourNvim/VapourNvim/main/install.sh | bash -s
```

## Manual Installation
```
git clone https://github.com/VapourNvim/VapourNvim ~/.config/nvim
nvim +PackerSync
```

## After Installation
You almost certainly want to add some plugins of your own. You can do it by making your own [config file](https://github.com/hackorum/VapourNvim/wiki/User-Configuration)
Please read the [wiki](https://github.com/VapourNvim/VapourNvim/wiki) for [Keybindings](https://github.com/hackorum/VapourNvim/wiki/Keybindings), [Language Servers](https://github.com/hackorum/VapourNvim/wiki/Language-Servers), [Plugins](https://github.com/hackorum/VapourNvim/wiki/Plugins) and [Screenshots](https://github.com/hackorum/VapourNvim/wiki/Screenshots).
After making VapourNvim your own, consider posting some screenshots [here](https://github.com/hackorum/VapourNvim/issues/20).

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the GPL-3.0 license.
