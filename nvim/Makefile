.DEFAULT_GOAL := install

~/.config/nvim/init.lua: init.lua
	[ -e ~/.config/nvim ] || mkdir -p ~/.config/nvim
	cp -f $< $@

~/.local/share/lunarvim/lvim:
	yes n | bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

~/.config/lvim/lua/mconfig:
	[ ! -e ~/.config/lvim ] || rm -rf ~/.config/lvim  
	[ -e ~/.config ] || mkdir -p ~/.config
	git clone https://github.com/jxlpzqc/LunarVimConfig.git ~/.config/lvim

install: ~/.local/share/lunarvim/lvim ~/.config/lvim/lua/mconfig ~/.config/nvim/init.lua

uninstall:
	rm -f ~/.config/nvim/init.lua
	rm -rf ~/.config/lvim/
	~/.local/share/lunarvim/lvim/utils/installer/uninstall.sh || true
	[ ! -e ~/.local/share/lunarvim ] || rm -rf ~/.local/share/lunarvim
	rm -rf ~/.cache/lvim || true

.PHONY: install uninstall
