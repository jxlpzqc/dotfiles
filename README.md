# My dot-files
Configuration files and install scripts for my commonly used tools.

# Prerequisite
Make sure `GNU make` is ready.

# Usage
## Get help
`make help` - show this help

## Install and uninstall all modules
`make install` - install all dotfiles  
`make uninstall` - uninstall all dotfiles

## Install some modules
`make install [module]` - install a module (e.g. make install nvim zsh)  
`make [module]` - equivalent to `make install [module]` (e.g. make nvim zsh)

## Uninstall some modules
```sh
cd path/to/moduleconf
make uninstall
```
