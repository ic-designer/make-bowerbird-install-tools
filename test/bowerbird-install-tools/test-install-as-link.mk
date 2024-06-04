PHONY: test-install-as-link-no-files
test-install-as-link-no-files:
	! $(MAKE) -q $(WORKDIR_TEST)/test-install-as-link-no-files/installed.sh

$(WORKDIR_TEST)/test-install-as-link-no-files/installed.sh:
	$(bowerbird::install-as-link)


PHONY: test-install-as-link-one-file
test-install-as-link-one-file: $(WORKDIR_TEST)/test-install-as-link-one-file/installed.sh
	diff -y $< $(WORKDIR_TEST)/test-install-as-link-one-file/alpha-link.sh
	test -L $<

$(WORKDIR_TEST)/test-install-as-link-one-file/installed.sh: \
		$(WORKDIR_TEST)/test-install-as-link-one-file/alpha-link.sh
	$(bowerbird::install-as-link)


PHONY: test-install-as-link-two-files
test-install-as-link-two-files: $(WORKDIR_TEST)/test-install-as-link-two-files/installed.sh
	diff -y $< $(WORKDIR_TEST)/test-install-as-link-two-files/alpha-link.sh
	test -L $<

$(WORKDIR_TEST)/test-install-as-link-two-files/installed.sh: \
		$(WORKDIR_TEST)/test-install-as-link-two-files/alpha-link.sh \
		$(WORKDIR_TEST)/test-install-as-link-two-files/beta-link.sh
	$(bowerbird::install-as-link)


PHONY: test-install-as-link-is-link
test-install-as-link-is-link: $(WORKDIR_TEST)/test-install-as-link-is-link/installed.sh
	test -L $<

$(WORKDIR_TEST)/test-install-as-link-%/installed.sh: \
		$(WORKDIR_TEST)/test-install-as-link-%/alpha-link.sh
	$(bowerbird::install-as-link)

.PRECIOUS: $(WORKDIR_TEST)/%-link.sh
$(WORKDIR_TEST)/%-link.sh: $(MAKEFILE_LIST)
	mkdir -p $(dir $@)
	echo 'function $(notdir $*) () { echo $(notdir $*) "$$@"; }' > $@
