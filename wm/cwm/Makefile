.POSIX:

CONFIGS=$(HOME)/.cwmrc $(HOME)/.xsession

all: $(CONFIGS)

$(HOME)/.cwmrc: $(PWD)/.cwmrc
	ln -sf $(PWD)/.cwmrc $(HOME)/.cwmrc

$(HOME)/.xsession: $(PWD)/.xsession
	ln -sf $(PWD)/.xsession $(HOME)/.xsession

clean:
	rm -f $(CONFIGS)

