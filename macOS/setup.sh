#!/bin/bash

warning="\033[0;33m"
sucess="\033[0;32m"
error="\033[0;31m"
info="\033[0;34m"
reset="\033[0m"

DOTFILE_PATH="$(pwd)/.dotfiles"
INSTALL_APP=true
INSTALL_NODE=true

for arg in "$@"; do
  case $arg in
  --no-app)
    INSTALL_APP=false
    shift
    ;;
  --no-node)
    INSTALL_NODE=false
    shift
    ;;
  --dotfiles=*)
    DOTFILE_PATH="${arg#*=}"
    shift
    ;;
  esac
done

export ZDOTDIR="$HOME/.config/zsh"

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
  echo -e "${sucess}Brew installed successfully${reset}"
else
  echo -e "${sucess}Brew already installed${reset}"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# Must have anything
echo -e "\n${info}Installing must have packages...${reset}"

brew update

brew install git \
  stow \
  bat \
  zoxide \
  tmux \
  nvim \
  ripgrep \
  fzf \
  fd \
  eza \
  lazygit \
  git-delta \
  yq

echo -e "${sucess}All packages installed${reset}"

# Clone dotfiles repository
if [ ! -d "$DOTFILE_PATH" ]; then
  echo -e "Cloning dotfiles repository..."
  git clone https://github.com/namnh198/dotfiles-public "$DOTFILE_PATH"
fi

# Reset stow
echo -e "${info} Stowing dotfiles..."
cd "$DOTFILE_PATH" || exit

stow -D .
stow .

echo -e "${info} Copying fonts..."
mkdir -p "$HOME/Library/Fonts"
cp -r ./macOS/fonts/* "$HOME/Library/Fonts/"
echo -e "${sucess}Fonts copied${reset}"

echo -e "${info} Building bat themes cache...${reset}"
bat cache --build

if [[ "$INSTALL_APP" = true ]]; then
  echo -e "\n${info}Installing application...${reset}"

  brew install --cask \
    bitwarden \
    raycast \
    ghostty \
    brave-browser \
    mac-mouse-fix \
    openkey \
    orbstack \
    the-unarchiver \
    zed

  echo -e "${sucess}All apps installed${reset}"
  echo -e "${info}MacOS Settings...${reset}"

  defaults write com.apple.dock "autohide-delay" -float "0" && killall Dock
  defaults write com.apple.Dock autohide -bool TRUE
  defaults write -g ApplePressAndHoldEnabled -bool false
fi

if [[ "$INSTALL_NODE" = true ]]; then
  echo -e "${info} Installing nodejs & bun...${reset}"
  brew install fnm oven-sh/bun/bun
  fnm install --lts
fi

echo -e "${sucess}Done.${reset}"
