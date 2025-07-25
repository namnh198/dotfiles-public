#!/bin/sh

# Install package dependencies
brew install git stow bat tmux nvim ripgrep fzf fd eza zoxide lazygit nvm

# Install app
brew install --cask ghostty brave-browser insomnia mac-mouse-fix openkey raycast the-unarchiver

# remove delay dock
defaults write com.apple.dock "autohide-delay" -float "0" && killall Dock

# bat theme
bat cache --build
