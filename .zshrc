source $HOME/.zprofile

export XDG_CONFIG_HOME="$HOME/.config"
export VISUAL="nvim"
export EDITOR="nvim"

# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions

zinit snippet https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh

HISTSIZE=50000
SAVEHIST=50000

if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

# aliases
alias g="git"
alias v="nvim"
alias vim="nvim"
alias c="clear"
alias cls="clear"
alias lz="lazygit"
alias tm="tmux"

ide() {
  tmux split-window -v -l 25%
  tmux split-window -h -l 50%
}

# zoxide
eval "$(zoxide init zsh)"
alias cd="z"

# bat
export BAT_THEME="catppuccin-mocha"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
alias cat="bat --style=plain --paging=never --color=always"

# eza
alias ll="eza -l -a --icons --git --group-directories-first"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --group-directories-first"
alias tree="eza --tree --all --color=always --icons --group-directories-first"
alias l="ll"

# fzf
eval "$(fzf --zsh)"
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --all --color=always --icons --group-directories-first {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

# Catpuccin Mocha theme for fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#313244,label:#CDD6F4"

export FZF_DEFAULT_COMAND="fd --hidden --follow --strip-cwd-prefix --exclude .git --exclude node_mocules --exclude vendor --exclude storage --exclude var --exclude .DS_Store"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
export FZF_TMUX_OPTS=" -p90%,70%"

# mise 
eval "$(mise activate zsh)"
