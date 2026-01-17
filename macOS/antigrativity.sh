#!/usr/bin/env bash

warning="\033[0;33m"
sucess="\033[0;32m"
error="\033[0;31m"
info="\033[0;34m"
reset="\033[0m"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ANTIGRAVITY_USER="$HOME/Library/Application Support/Antigravity/User"

echo -e "${info} SymlinkingAntigravity settings...${reset}"

unlink "$ANTIGRAVITY_USER/settings.json"
ln -s "$SCRIPT_DIR/antigravity/settings.json" "$ANTIGRAVITY_USER/settings.json"
unlink "$ANTIGRAVITY_USER/keybindings.json"
ln -s "$SCRIPT_DIR/antigravity/keybindings.json" "$ANTIGRAVITY_USER/keybindings.json"

echo -e "${sucess}Symlinked Antigravity settings...${reset}"

echo -e "${info} Installing Antigravity extensions...${reset}"

if command -v agy &>/dev/null; then
  agy --install-extension PKief.material-icon-theme
  agy --install-extension Catppuccin.catppuccin-vsc
  agy --install-extension mhutchie.git-graph
  agy --install-extension dbaeumer.vscode-eslint
  agy --install-extension GraphQL.vscode-graphql
  agy --install-extension GraphQL.vscode-graphql-syntax
  agy --install-extension csstools.postcss
  agy --install-extension esbenp.prettier-vscode
  agy --install-extension bradlc.vscode-tailwindcss
  agy --install-extension devsense.phptools-vscode
  agy --install-extension devsense.profiler-php-vscode
  agy --install-extension devsense.composer-php-vscode
  agy --install-extension laravel.vscode-laravel
  agy --install-extension pbogut.magento2-ls
  echo -e "${sucess}Installed Antigravity extensions...${reset}"
else
  echo -e "${error}agy is not installed${reset}"
  exit 1
fi
