# Targets
PHONY: test-install-as-copy
test-install-as-copy: \
		test-install-as-copy-no-files \
		test-install-as-copy-one-file \
		test-install-as-copy-two-files \
		test-install-as-copy-not-link \


PHONY: test-install-as-copy-no-files
test-install-as-copy-no-files:
	@! $(MAKE) -q $(WORKDIR_TEST)/test-install-as-copy-no-files/installed.sh
	@printf "\e[1;32mPassed: $(lastword $(MAKEFILE_LIST))::$@\e[0m\n"

$(WORKDIR_TEST)/test-install-as-copy-no-files/installed.sh:
	$(bowerbird::install-as-copy)


PHONY: test-install-as-copy-one-file
test-install-as-copy-one-file: $(WORKDIR_TEST)/test-install-as-copy-one-file/installed.sh
	@diff -y $< $(WORKDIR_TEST)/test-install-as-copy-one-file/alpha-copy.sh
	@printf "\e[1;32mPassed: $(lastword $(MAKEFILE_LIST))::$@\e[0m\n"

$(WORKDIR_TEST)/test-install-as-copy-one-file/installed.sh: \
		$(WORKDIR_TEST)/test-install-as-copy-one-file/alpha-copy.sh
	$(bowerbird::install-as-copy)


PHONY: test-install-as-copy-two-files
test-install-as-copy-two-files: $(WORKDIR_TEST)/test-install-as-copy-two-files/installed.sh
	@diff -y $< $(WORKDIR_TEST)/test-install-as-copy-two-files/alpha-copy.sh
	@printf "\e[1;32mPassed: $(lastword $(MAKEFILE_LIST))::$@\e[0m\n"

$(WORKDIR_TEST)/test-install-as-copy-two-files/installed.sh: \
		$(WORKDIR_TEST)/test-install-as-copy-two-files/alpha-copy.sh \
		$(WORKDIR_TEST)/test-install-as-copy-two-files/beta-copy.sh
	$(bowerbird::install-as-copy)


PHONY: test-install-as-copy-not-link
test-install-as-copy-not-link: $(WORKDIR_TEST)/test-install-as-copy-not-link/installed.sh
	@! test -L $<
	@printf "\e[1;32mPassed: $(lastword $(MAKEFILE_LIST))::$@\e[0m\n"

$(WORKDIR_TEST)/test-install-as-copy-%/installed.sh: \
		$(WORKDIR_TEST)/test-install-as-copy-%/alpha-copy.sh
	$(bowerbird::install-as-copy)


.PRECIOUS: $(WORKDIR_TEST)/%-copy.sh
$(WORKDIR_TEST)/%-copy.sh: $(MAKEFILE_LIST)
	@mkdir -p $(dir $@)
	@echo 'function $(notdir $*) () { echo $(notdir $*) "$$@"; }' > $@