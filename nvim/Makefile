.DEFAULT_GOAL := install

~/.config/nvim/init.lua: init.lua
	cp -f $< $@

~/.local/share/lunarvim/lvim:
	bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

~/.config/lvim/lua/mconfig:
	rm -rf ~/.config/lvim
	git clone https://github.com/jxlpzqc/LunarVimConfig.git ~/.config/lvim

install: ~/.local/share/lunarvim/lvim ~/.config/lvim/lua/mconfig ~/.config/nvim/init.lua

uninstall:
	rm -f ~/.config/nvim/init.lua

.PHONY: install uninstall
