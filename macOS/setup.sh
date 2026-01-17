#!/bin/bash

warning="\033[0;33m"
sucess="\033[0;32m"
error="\033[0;31m"
info="\033[0;34m"
reset="\033[0m"

# Ask for the administrator password upfront
sudo -v

# Install xCode cli tools
if [[ "$(uname)" == "Darwin" ]]; then
  echo -e "${info}macOS deteted...${reset}"

  if xcode-select -p &>/dev/null; then
    echo -e "${sucess}Xcode already installed${reset}"
  else
    echo -e "${info}Installing commandline tools...${reset}"
    xcode-select --install
    echo -e "${info}Please run script again after installing commandline tools...${reset}"
    exit
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
  git-delta \
  yq \
  antigravity

echo -e "${sucess}All packages installed${reset}"

echo -e "\n${info}Installing application...${reset}"

brew install --cask \
  font-jetbrains-mono-nerd-font \
  bitwarden \
  raycast \
  ghostty \
  brave-browser \
  insomnia \
  mac-mouse-fix \
  openkey \
  orbstack \
  the-unarchiver

echo -e "${sucess}All apps installed${reset}"
echo -e "${info}MacOS Settings...${reset}"

defaults write com.apple.dock "autohide-delay" -float "0" && killall Dock
defaults write com.apple.Dock autohide -bool TRUE
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

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
echo -e "${info} Building bat themes cache...${reset}"
bat cache --build

echo -e "${info} Changing themes fast-synstax-hightlight...${reset}"
fast-theme XDG:catppuccin-mocha

# install bun
echo -e "${info} Installing bun packages...${reset}"
curl -fsSL https://bun.com/install | bash
echo -e "${info} Installed bun packages...${reset}"
echo -e "${sucess}Done.${reset}"
