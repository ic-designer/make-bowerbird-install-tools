# Bowerbird Install Tools

[![Makefile CI](https://github.com/ic-designer/make-bowerbird-install-tools/actions/workflows/makefile.yml/badge.svg)](https://github.com/ic-designer/make-bowerbird-install-tools/actions/workflows/makefile.yml)

## Installation

The Bowerbird Test Tools can be loaded using the Bowerbird Dependency Tools as shown
below. Please refer the [Bowerbird Depend Tools](https://github.com/ic-designer/make-bowerbird-deps.git)
for more information about the `bowerbird::git-dependency` macro.

```makefile
$(eval $(call bowerbird::git-dependency,$(WORKDIR_DEPS)/bowerbird-install-tools,\
		https://github.com/ic-designer/make-bowerbird-install-tools.git,main,bowerbird.mk))
```

## Macros

### `bowerbird::install-as-copy`

```
bowerbird::install-as-copy

	Recipe for installing files as copies. The target filepath for the installed copy
	is defined by the $@ variable, and the filepath for the source is defined by the
	first prerequisite $< variable.

    Args:
        $@: Target location for the copy.
        $<: Source location of the copy.

    Example:
	    $(HOME)/.local/lib/installed-copy: source-file
            $(bowerbird::bowerbird::install-as-copy)
```

### `bowerbird::install-as-executable`

```
bowerbird::install-as-executable

	Recipe for installing files as executable with permission 544. The target filepath
	for the installed execuatable is defined by the $@ variable, and the filepath for
	the source is defined by the first prerequisite $< variable.

    Args:
        $@: Target location for the executable.
        $<: Source location of the executable.

    Example:
        $(HOME)/.local/bin/installed-executable: source-file
      	    $(bowerbird::bowerbird::install-as-executable)
```

### `bowerbird::install-as-link`

```
bowerbird::install-as-link

	Recipe for installing files as symbolic links. The target filepath for the symbolic
	link by the $@ variable, and the filepath for the source is defined by the first
	prerequisite $< variable.

    Args:
        $@: Target location for the symbolic link.
        $<: Source location of the symbolic link.

    Example:
        $(HOME)/installed-link: source-file
            $(bowerbird::bowerbird::install-as-link)
```
