.DEFAULT_GOAL := install

CONFIG_DIR := $(HOME)
CONFIG_FILE := $(CONFIG_DIR)/.muttrc
SRC_FILE := muttrc

NOTE_MSG := "NOTE: You need to configure your login info in .muttrc to take effect."

$(CONFIG_FILE): $(SRC_FILE)
	cp $< $@
	@echo "\e[31m$(NOTE_MSG)\e[0m"
	

install: $(CONFIG_FILE)

uninstall:
	rm -f $(CONFIG_FILE)

.PHONY: install uninstall
