test-install-as-executable-no-files:
	! $(MAKE) -q $(WORKDIR_TEST)/test-install-as-executable-no-files/installed.sh

$(WORKDIR_TEST)/test-install-as-executable-no-files/installed.sh:
	$(bowerbird::install-as-executable)


test-install-as-executable-one-file: $(WORKDIR_TEST)/test-install-as-executable-one-file/installed.sh
	diff -y $< $(WORKDIR_TEST)/test-install-as-executable-one-file/alpha-executable.sh
	test -x $<

$(WORKDIR_TEST)/test-install-as-executable-one-file/installed.sh: \
		$(WORKDIR_TEST)/test-install-as-executable-one-file/alpha-executable.sh
	$(bowerbird::install-as-executable)


test-install-as-executable-two-files: $(WORKDIR_TEST)/test-install-as-executable-two-files/installed.sh
	diff -y $< $(WORKDIR_TEST)/test-install-as-executable-two-files/alpha-executable.sh
	test -x $<

$(WORKDIR_TEST)/test-install-as-executable-two-files/installed.sh: \
		$(WORKDIR_TEST)/test-install-as-executable-two-files/alpha-executable.sh \
		$(WORKDIR_TEST)/test-install-as-executable-two-files/beta-executable.sh
	$(bowerbird::install-as-executable)


test-install-as-executable-is-executable: $(WORKDIR_TEST)/test-install-as-executable-is-executable/installed.sh
	test -x $<

$(WORKDIR_TEST)/test-install-as-executable-%/installed.sh: \
		$(WORKDIR_TEST)/test-install-as-executable-%/alpha-executable.sh
	$(bowerbird::install-as-executable)


.PRECIOUS: $(WORKDIR_TEST)/%-executable.sh
$(WORKDIR_TEST)/%-executable.sh: $(MAKEFILE_LIST)
	mkdir -p $(dir $@)
	echo 'function $(notdir $*) () { echo $(notdir $*) "$$@"; }' > $@
