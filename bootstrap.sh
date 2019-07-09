#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

# rsync transfers and syncs files between multiple areas
# doIt() syncs `.` to `~` with the following options
# -a, --archive It is a quick way  of  saying  you  want  recursion
# and  want  to preserve  almost  everything  (with -H being a notable omission).
# -v, --verbose
# -h, --human-readable. Output numbers in a more human-readable format.
# and then updates the shell to the new .zshprofile
function doIt() { rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "/zsh_custom" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.zprofile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
