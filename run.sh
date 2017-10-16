#!/usr/bin/env bash

###############################################################################
# FUNCTIONS
###############################################################################

#------------------------------------------------------------------------------
# cmd - run a command with debug tracing on
#------------------------------------------------------------------------------
cmd () {
	set -x
	$*
	# trick from https://stackoverflow.com/a/19226038
	{ set +x; } 2>/dev/null
}

set_gitconfig () {
	SOURCE=$(find $(pwd) -name .gitconfig)
	TARGET=$HOME/.gitconfig

	cmd ln -hfs $SOURCE $TARGET
}

set_gitignore () {
	SOURCE=$(find $(pwd) -name .gitignore_global)
	TARGET=$HOME/.gitignore_global

	cmd ln -hfs $SOURCE $TARGET
}

###############################################################################
# MAIN
###############################################################################

#
# (over)write links to global config
#
set_gitconfig
set_gitignore
