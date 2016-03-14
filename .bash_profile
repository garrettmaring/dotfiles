#!/bin/bash
#
#
echo "Loading ${HOME}/.bash_profile"
sh ~/dotfiles/create-dotfile-links.sh # Create linkes from dotfile dir to global
source ~/.profile # Get the paths
source ~/.bashrc  # Get aliases
