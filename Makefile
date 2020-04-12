DOTFILES_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
PATH := $(DOTFILES_DIR)/bin:$(PATH)

all: packages apps link cleanup

packages: brew git cask yarn cask

apps: ohmyzsh vscode


# Packages

brew:
	is_executable brew || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash

cask: brew
	brew update

git: brew
	is_executable git || brew install git git-extras

yarn: brew
	brew install yarn


# Apps

ohmyzsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

vscode: brew cask
	brew cask install visual-studio-code

tmux: brew
	brew install tmux

# Link and cleanup

link: apps packages
	sh installdotfiles.sh

cleanup: link
	brew cleanup
