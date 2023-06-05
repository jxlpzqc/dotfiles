.DEFAULT_GOAL := install

~/.tmux.conf: tmux.conf
	cp -f $< $@

install: ~/.tmux.conf

uninstall:
	rm -f ~/.tmux.conf

.PHONY: install uninstall
