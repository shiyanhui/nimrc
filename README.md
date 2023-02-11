# nimrc

A simple NeoVim configuration.

## Install

First install packer,

```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Then clone this repository,

```shell
git clone git@github.com:shiyanhui/nimrc.git ~/.config/nvim
```

Finally initialize the environment,

```shell
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

## Screenshots

<img src='https://raw.githubusercontent.com/shiyanhui/nimrc/master/doc/screenshots/screenshot.png' width='800'>
