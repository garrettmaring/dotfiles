#!/bin/bash

cat << Header

/*===============================================
=            Initializing Hyperdrive            =
===============================================*/

"Not all those who wander are lost." - Bilbo Baggins

Header
sleep 1

if [ "$EUID" -ne 0 ]; then # The script needs to be run as root (gems, db dirs)
  printf "\nThis script needs to be run as root! $ sudo bash setup-new-dev-environment.sh\n"
  exit
fi

NAME=$(logname) # Get non-root user

## Link dotfiles with system config files
printf "\n/*----------  Configuring dotfiles  ----------*/\n\n"
bash create-dotfile-links.sh

# ## Install Homebrew
if ! hash brew 2>/dev/null; then ## Check if homebrew is already installed
  printf "\n/*----------  Downloading Homebrew  ----------*/\n\n"
  sudo -u $NAME /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

## Installing brew packages, gems, node modules, and python packages
printf "\n/*----------  Installing all packages  ----------*/\n"
printf "\nBrew packages: \n"
cat ./brew_packages | sudo -u $NAME xargs brew install # Shouldn't run brew install with sudo permissions
printf "\nRuby gems: \n"
cat ./gems | xargs gem install
printf "\nNode modules: \n"
cat ./node_modules | xargs npm install -g
printf "\nPython packages: \n"
cat ./python_packages | sudo -H xargs pip install

## Databases
if [ ! -d /data/db ]; then
  printf "\n/*----------  Configuring mongoDB  ----------*/\n\n"
  mkdir -p /data/db
  sudo chown $NAME /data/db
fi

printf "\n/*----------  Configuring postgreSQL  ----------*/\n\n"
sudo -u $NAME initdb /usr/local/var/postgres -E utf8
if [ ! -d ~/Library/LaunchAgents ]; then
  mkdir -p ~/Library/LaunchAgents
fi
cp /usr/local/Cellar/postgresql/9.2.1/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents/

## Vim
printf "\n/*----------  Setting up Vim  ----------*/\n\n"
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

sudo -u $NAME vim +PluginInstall +qall
sudo -u $NAME brew link vim # Set default vim to be brew's vim

## Make zsh default shell
# TODO: Do check for if is in /etc/shells already
printf "\n/*----------  Setting up zsh  ----------*/\n\n"
echo "/usr/local/bin/zsh" >> /etc/shells
sudo -u $NAME chsh -s $(which zsh)
# Downloading and installing powerline fonts
cd
git clone https://github.com/powerline/fonts.git
./fonts/install.sh

cat << Footer

/*=====  All done. Taking Hyperdrive offline. Please restart your terminal!  ======*/

Footer
