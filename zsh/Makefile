.DEFAULT_GOAL := install

~/.zshrc: zshrc
	cp $< $@

~/.p10k.zsh: p10k.zsh
	cp $< $@

~/.oh-my-zsh: 
	git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

~/.oh-my-zsh/custom/plugins/zsh-autosuggestions:
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting:
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

~/.oh-my-zsh/custom/themes/powerlevel10k:
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

install: ~/.oh-my-zsh \
	~/.oh-my-zsh/custom/plugins/zsh-autosuggestions \
	~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting \
	~/.oh-my-zsh/custom/themes/powerlevel10k \
	~/.zshrc ~/.p10k.zsh;

uninstall:
	rm -rf ~/.zshrc ~/.p10k.zsh ~/.oh-my-zsh

.PHONY: install uninstall
