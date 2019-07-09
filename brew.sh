#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install zsh
brew install zsh

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/zsh" /etc/shells; then
	echo "${BREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells;
	chsh -s "${BREW_PREFIX}/bin/zsh";
fi;

# Install `wget`
brew install wget

# Install GnuPG to enable PGP-signing commits.
# https://gist.github.com/troyfontaine/18c9146295168ee9ca2b30c00bd1b41e
brew install gpg2 gnupg pinentry-mac
GNUPG_DIR="$HOME/.gnupg"
AGENT_FILE="$GNUPG_DIR/gpg-agent.conf"
CONF_FILE="$GNUPG_DIR/gpg.conf"

if ! test -f "$AGENT_FILE"; then
	touch $AGENT_FILE
fi
echo "pinentry-program /usr/local/bin/pinentry-mac"  >> $AGENT_FILE

if ! test -f "$CONF_FILE"; then
	touch $CONF_FILE
fi
echo "# Uncomment within config (or add this line)
# This tells gpg to use the gpg-agent
use-agent" >> $CONF_FILE

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# # Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli
brew install tmux # tmux is a terminal multiplexe

# Install useful web dev binaries
brew install mosh
brew install jq # a command line JSON processor

# Remove outdated versions from the cellar.
brew cleanup

# make zsh the default shell for homebrew
dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

gpg --full-gen-key
