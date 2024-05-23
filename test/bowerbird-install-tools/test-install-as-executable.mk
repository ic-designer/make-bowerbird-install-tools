# Targets
PHONY: test-install-as-executable
test-install-as-executable: \
		test-install-as-executable-no-files \
		test-install-as-executable-one-file \
		test-install-as-executable-two-files \
		test-install-as-executable-is-executable


PHONY: test-install-as-executable-no-files
test-install-as-executable-no-files:
	@! $(MAKE) -q $(WORKDIR_TEST)/test-install-as-executable-no-files/installed.sh
	@printf "\e[1;32mPassed: $(lastword $(MAKEFILE_LIST))::$@\e[0m\n"

$(WORKDIR_TEST)/test-install-as-executable-no-files/installed.sh:
	$(bowerbird::install-as-executable)


PHONY: test-install-as-executable-one-file
test-install-as-executable-one-file: $(WORKDIR_TEST)/test-install-as-executable-one-file/installed.sh
	@diff -y $< $(WORKDIR_TEST)/test-install-as-executable-one-file/alpha-executable.sh
	@test -x $<
	@printf "\e[1;32mPassed: $(lastword $(MAKEFILE_LIST))::$@\e[0m\n"

$(WORKDIR_TEST)/test-install-as-executable-one-file/installed.sh: \
		$(WORKDIR_TEST)/test-install-as-executable-one-file/alpha-executable.sh
	$(bowerbird::install-as-executable)


PHONY: test-install-as-executable-two-files
test-install-as-executable-two-files: $(WORKDIR_TEST)/test-install-as-executable-two-files/installed.sh
	@diff -y $< $(WORKDIR_TEST)/test-install-as-executable-two-files/alpha-executable.sh
	@test -x $<
	@printf "\e[1;32mPassed: $(lastword $(MAKEFILE_LIST))::$@\e[0m\n"

$(WORKDIR_TEST)/test-install-as-executable-two-files/installed.sh: \
		$(WORKDIR_TEST)/test-install-as-executable-two-files/alpha-executable.sh \
		$(WORKDIR_TEST)/test-install-as-executable-two-files/beta-executable.sh
	$(bowerbird::install-as-executable)


PHONY: test-install-as-executable-is-executable
test-install-as-executable-is-executable: $(WORKDIR_TEST)/test-install-as-executable-is-executable/installed.sh
	@test -x $<
	@printf "\e[1;32mPassed: $(lastword $(MAKEFILE_LIST))::$@\e[0m\n"

$(WORKDIR_TEST)/test-install-as-executable-%/installed.sh: \
		$(WORKDIR_TEST)/test-install-as-executable-%/alpha-executable.sh
	$(bowerbird::install-as-executable)


.PRECIOUS: $(WORKDIR_TEST)/%-executable.sh
$(WORKDIR_TEST)/%-executable.sh: $(MAKEFILE_LIST)
	@mkdir -p $(dir $@)
	@echo 'function $(notdir $*) () { echo $(notdir $*) "$$@"; }' > $@
