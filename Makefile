PLUGIN=check_bluetooth_battery
VERSION=`cat VERSION`
DIST_DIR=$(PLUGIN)-$(VERSION)
DIST_FILES=AUTHORS COPYING ChangeLog INSTALL Makefile NEWS README.md TODO VERSION $(PLUGIN) COPYRIGHT
YEAR=`date +"%Y"`

dist: version_check copyright_check
	rm -rf $(DIST_DIR) $(DIST_DIR).tar.gz
	mkdir $(DIST_DIR)
	cp $(DIST_FILES) $(DIST_DIR)
	tar cfz $(DIST_DIR).tar.gz  $(DIST_DIR)
	tar cfj $(DIST_DIR).tar.bz2 $(DIST_DIR)

install:
	mkdir -p $(DESTDIR)
	install -m 755 $(PLUGIN) $(DESTDIR)

version_check:
	VERSION=`cat VERSION`
	grep -q "VERSION\ *=\ *[\'\"]*$(VERSION)" $(PLUGIN)
	grep -q "${VERSION}" NEWS
	echo "Version check: OK"

copyright_check:
	grep -q "(c) Matteo Corti, 2009-$(YEAR)" README.md
	grep -q "Copyright (c) 2009-$(YEAR) Matteo Corti" COPYRIGHT
	grep -q "Copyright (c) 2009-$(YEAR) Matteo Corti <matteo@corti.li>" $(PLUGIN)
	echo "Copyright year check: OK"

clean:
	rm -f *~
