
PREFIX = /usr/local

bliv: bliv.sh bliv.awk bliv.tsv
	cat bliv.sh > $@
	echo 'exit 0' >> $@
	echo "#EOF" >> $@
	tar cz bliv.awk bliv.tsv >> $@
	chmod +x $@

test: bliv.sh
	shellcheck -s sh bliv.sh

clean:
	rm -f bliv

install: bliv
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f bliv $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/bliv

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/bliv

.PHONY: test clean install uninstall
