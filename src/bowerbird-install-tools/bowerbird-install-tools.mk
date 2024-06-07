# bowerbird::install-as-copy
#
#	Recipe for installing files as copies. The target filepath for the installed copy
#	is defined by the $@ variable, and the filepath for the source is defined by the
#	first prerequisite $< variable.
#
#   Args:
#       $@: Target location for the copy.
#       $<: Source location of the copy.
#
#   Example:
#		$(HOME)/.local/lib/installed-copy: source-file
#       	$(bowerbird::bowerbird::install-as-copy)
#
define bowerbird::install-as-copy
	@echo "INFO: Installing copy $@..."
	@install -dv $(dir $@)
	@install -Sv $< $@
	diff $@ $<
	! test -L $@
	@echo "INFO: Installing copy $@ completed."
endef

# bowerbird::install-as-executable
#
#	Recipe for installing files as executable with permission 544. The target filepath
#	for the installed execuatable is defined by the $@ variable, and the filepath for
#	the source is defined by the first prerequisite $< variable.
#
#	Args:
#		$@: Target location for the executable.
#       $<: Source location of the executable.
#
#	Example:
#		$(HOME)/.local/bin/installed-executable: source-file
#			$(bowerbird::bowerbird::install-as-executable)
#
define bowerbird::install-as-executable
	@echo "INFO: Installing executable $@..."
	@install -dv $(dir $@)
	@install -Sv -m 544 $< $@
	diff $@ $<
	test -x $@
	@echo "INFO: Installing executable $@ completed."
endef

# bowerbird::install-as-link
#
#	Recipe for installing files as symbolic links. The target filepath for the symbolic
#	link by the $@ variable, and the filepath for the source is defined by the first
#	prerequisite $< variable.
#
#   Args:
#       $@: Target location for the symbolic link.
#       $<: Source location of the symbolic link.
#
#   Example:
#		$(HOME)/installed-link: source-file
#			$(bowerbird::bowerbird::install-as-link)
#
define bowerbird::install-as-link
	@echo "INFO: Installing link $@..."
	@install -dv $(dir $@)
	@ln -sfv $(realpath $<) $@
	diff $@ $<
	test -L $@
	@echo "INFO: Installing link $@ completed."
endef
