# Config
.SUFFIXES:
MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --no-print-directory
# MAKEFLAGS += --jobs=16

# Constants
NAME ?= $(error ERROR: Undefined variable NAME)
VERSION ?= $(error ERROR: Undefined variable VERSION)
WORKDIR_ROOT ?= $(error ERROR: Undefined variable WORKDIR_ROOT)
override WORKDIR_TEST = $(WORKDIR_ROOT)/test/$(NAME)/$(VERSION)

# Includes
include bowerbird.mk
include test/bowerbird-install-tools/test-install-as-copy.mk
include test/bowerbird-install-tools/test-install-as-executable.mk
include test/bowerbird-install-tools/test-install-as-link.mk

 # Targets
.PHONY: private_clean
private_clean:
	@echo "INFO: Cleaning directories:"
	@$(if $(wildcard $(WORKDIR_ROOT)), rm -rfv $(WORKDIR_ROOT))
	@$(if $(wildcard $(WORKDIR_TEST)), rm -rfv $(WORKDIR_TEST))
	@echo "INFO: Cleaning complete."
	@echo

.PHONY: private_test
private_test: \
		test-install-as-copy \
		test-install-as-executable \
		test-install-as-link \
