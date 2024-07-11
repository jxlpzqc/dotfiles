.DEFAULT_GOAL := install

install: ~/.config/nvim
	cp -rf ./nvim ~/.config
	@echo "Installed nvim configuration, try running nvim to further install plugins"

uninstall:
	rm -rf ~/.config/nvim \
		~/.local/share/nvim \
		~/.local/state/nvim \
		~/.cache/nvim

.PHONY: install uninstall
