.POSIX:

SCRIPTS=$(HOME)/bin/status.sh

all: scripts

scripts: $(SCRIPTS)

$(HOME)/bin:
	mkdir -p "$(HOME)/bin"

$(HOME)/bin/status.sh: $(HOME)/bin $(PWD)/status.sh
	ln -s $(PWD)/status.sh $(HOME)/bin/status.sh

$(HOME)/bin/launcher.sh: $(HOME)/bin $(PWD)/launcher.sh
	ln -s $(PWD)/launcher.sh $(HOME)/bin/launcher.sh

clean:
	rm -f $(SCRIPTS)
	if [ -d $(HOME)/bin -a `ls -1a | sed -E '/^\.\.?$$/d' | wc -l` -gt 0 ]; then \
		rmdir $(HOME)/bin; \
	fi
