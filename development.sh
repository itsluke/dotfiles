#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# install nvm

# Install web development tools

# # PHP and associated applications
# brew tap homebrew/dupes
# brew tap kyslik/php
# brew install php72 php72-mongodb
# brew link --force php72
# brew install composer
# brew cask install phpstorm # this requires a license

# Node and associated applications
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
brew cask install visual-studio-code
# Install yarn and useful global packages
brew install yarn
yarn global add create-react-app
yarn global add next
yarn global add next

# Python and associated applications
brew install python python@2
brew install pyenv
pip3 install virtualenv
pip3 install virtualenvwrapper
# pythong IDE
brew cask install pycharm-ce
# iPython with pandas
brew install zeromq
pip install ipython pandas jinja2 tornado pyzmq pygments python-dateutil pytz

# # JAVA and associated applications
# brew tap AdoptOpenJDK/openjdk
# brew cask install adoptopenjdk8
# brew cask install adoptopenjdk11


# Remove outdated versions from the cellar.
brew cleanup
