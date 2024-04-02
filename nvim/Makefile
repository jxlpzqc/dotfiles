.DEFAULT_GOAL := install

~/.config/nvim:
	git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim

~/.config/nvim/lua/user: user
	cp -ar user ~/.config/nvim/lua

install: ~/.config/nvim ~/.config/nvim/lua/user

uninstall:
	rm -rf ~/.config/nvim \
		~/.local/share/nvim \
		~/.local/state/nvim \
		~/.cache/nvim

.PHONY: install uninstall
