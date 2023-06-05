.DEFAULT_GOAL := install

~/.tmux.conf: tmux.conf
	cp $(PWD)/tmux.conf ~/.tmux.conf

install: ~/.tmux.conf

uninstall:
	rm -f ~/.tmux.conf

.PHONY: install uninstall
