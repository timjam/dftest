all: apps link

apps: brew git ohmyzsh vscode yarn

brew:
  is_executable brew || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash

git: brew
	brew install git git-extras

ohmyzsh:
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

yarn: brew
  brew install yarn

link: apps
  sh installdotfiles.sh