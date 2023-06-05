.DEFAULT_GOAL := install

CONFIG_DIR := $(HOME)/.config/kitty
CONFIG_FILE := $(CONFIG_DIR)/kitty.conf
SRC_FILE := kitty.conf


$(CONFIG_FILE): $(SRC_FILE)
	cp $< $@

install: $(CONFIG_FILE)

uninstall:
	rm -f $(CONFIG_FILE)

.PHONY: install uninstall
