# dotfiles

My personal dotfiles repository. This is my repository for custom dotfiles, rc files, themes, and other configurations. Use it as inspiration, or take pieces for yourself!

The repository uses [dotpatina](https://github.com/axis7818/dotpatina) to manage dotfiles on the system.

## Usage

Copy & create a variables file:

```sh
cp sample-vars.toml vars.toml
vim vars.toml
```

Install Patina files on mac:

```sh
dotpatina apply patina-mac.toml --vars vars.toml
```
