#!/bin/bash

warning="\033[0;33m"
sucess="\033[0;32m"
error="\033[0;31m"
info="\033[0;34m"
reset="\033[0m"

# Install xCode cli tools
if [[ "$(uname)" == "Darwin" ]]; then
  echo -e "${info}macOS deteted...${reset}"

  if xcode-select -p &>/dev/null; then
    echo -e "${sucess}Xcode already installed${reset}"
  else
    echo -e "${info}Installing commandline tools...${reset}"
    xcode-select --install
  fi
else
  echo -e "${error}Script only support macOS${reset}"
  exit
fi

if [[ ! -f "/opt/homebrew/bin/brew" ]]; then
  echo -e "${warning}Brew not found, Try installing...${reset}"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  echo -e "${sucess}Brew installed successfully${reset}"
else
  echo -e "${sucess}Brew already installed${reset}"
fi

# Must have anything
echo -e "\n${info}Installing must have packages...${reset}"

brew install git \
  stow \
  bat \
  tmux \
  nvim \
  ripgrep \
  fzf \
  fd \
  eza \
  lazygit \
  mise

echo -e "${sucess}All packages installed${reset}"

echo -e "\n${info}Installing application...${reset}"

brew install --cask ghostty \
  iterm2 \
  brave-browser \
  insomina \
  mac-mouse-fix \
  openkey \
  raycast \
  orbstack \
  visual-studio-code \
  the unarchived

echo -e "${sucess}All apps installed${reset}"
echo -e "${info}MacOS Settings...${reset}"

defaults write com.apple.dock "autohide-delay" -float "0" && killall Dock
defaults write com.apple.Dock autohide -bool TRUE
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write InitialKeyRepeat -int 15

# Clone dotfiles repository
if [ ! -d "$HOME/.dotfiles" ]; then
  echo -e "Cloning dotfiles repository..."
  git clone https://github.com/namnh198/dotfiles-public ~/.dotfiles
fi

# Reset stow
echo -e "${info} Stowing dotfiles..."
cd "$HOME/.dotfiles" || exit

stow -D .
stow .
bat cache --build
