help:
	@echo "dotfiles installer 0.1.0"
	@echo "Usage:"
	@echo "    make help - show this help"
	@echo "    make install - install all dotfiles"
	@echo "    make uninstall - uninstall all dotfiles"
	@echo "    make install [module] - install a module (e.g. make install nvim)"
	@echo "    make [module] - install a module (e.g. make install nvim)"

INSTALL_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))

ifeq ($(INSTALL_ARGS),)
	INSTALL_ARGS = $(patsubst %/,%,$(wildcard */))
endif

install: $(INSTALL_ARGS)
	@echo 
	@echo "-------------------------------"
	@echo "dotfiles installed successfully"
	@echo "$(words $(INSTALL_ARGS)) configurations has been installed,"
	@echo "including $(INSTALL_ARGS)."

uninstall:
	@for dir in $(INSTALL_ARGS); do \
		$(MAKE) -C $$dir uninstall; \
	done
	@echo "-------------------------------"
	@echo "dotfiles uninstalled successfully"
	@echo "$(words $(INSTALL_ARGS)) configurations has been uninstalled,"
	@echo "including $(INSTALL_ARGS)."

$(INSTALL_ARGS):
	@echo "configure $@"
	@$(MAKE) -C $@ install
	@echo "configure $@ done"

.PHONY: all help install uninstall $(INSTALL_ARGS)
