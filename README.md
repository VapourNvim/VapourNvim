# NeoVim

My neovim config written in lua.

## Prerequisites
* Neovim >= 0.5 nightly version

## Installation

* Neovim 0.5 MacOS



```bash
brew install --HEAD neovim
```

* Neovim 0.5 Ubuntu

```bash
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

* Neovim 0.5 Arch
```bash
yay -S neovim-nightly-git
OR
paru -S neovim-nightly-git
```

* Neovim 0.5 Windows
```bash
choco install neovim --pre
```

## Usage

* Mac and Linux
```bash
cd ~/.config
git clone https://github.com/hackorum/nvim.git
nvim
:PackerSync
```

* Windows
```powershell
md ~\AppData\Local\nvim
cd ~\AppData\Local\nvim
git clone https://github.com/hackorum/nvim.git
nvim
:PackerSync
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
