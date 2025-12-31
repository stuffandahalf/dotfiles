.POSIX:

CONFIGS=$(HOME)/.vimrc #$(HOME)/.tmuxrc
XCONFIGS=$(HOME)/.Xresources

all: $(CONFIGS) scripts

$(HOME)/.vimrc: $(PWD)/.vimrc
	ln -sf $(PWD)/.vimrc $(HOME)/.vimrc

$(HOME)/.tmuxrc: $(PWD)/.tmuxrc
	ln -sf $(PWD)/.tmuxrc $(HOME)/.tmuxrc

xorg: $(XCONFIGS)

$(HOME)/.Xresources: $(PWD)/.Xresources
	ln -sf $(PWD)/.Xresources $(HOME)/.Xresources

scripts:
	#cd bin && $(MAKE)
	if [ -d `uname -s` ]; then \
		cd `uname -s` && $(MAKE) scripts; \
	fi

cwm: xorg wm/cwm
	cd wm/cwm && $(MAKE)

clean:
	rm -f $(CONFIGS) $(XCONFIGS)
	cd wm/cwm && $(MAKE) clean
	if [ -d `uname -s` ]; then \
		cd `uname -s` && $(MAKE) clean; \
	fi

