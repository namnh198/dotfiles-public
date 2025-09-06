if [[ -f "/opt/homebrew/bin/brew" ]]; then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

source $HOME/.zprofile

export XDG_CONFIG_HOME="$HOME/.config"
export VISUAL="nvim"
export EDITOR="nvim"
export XDG_DATA_HOME="$HOME/.local/share"
export NODE_PATH="$XDG_DATA_HOME/npm"

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
HISTFILE="$XDG_DATA_HOME/zsh/history"
mkdir -p "$(dirname "$HISTFILE")"

if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

ide() {
  tmux split-window -v -l 25%
  tmux split-window -h -l 50%
}

eval "$(zoxide init zsh --cmd cd)"

export BAT_THEME="Catppuccin Mocha"

eval "$(fzf --zsh)"
SHOW_FILE_OR_DIR_PREVIEW="if [ -d {} ]; then eza --tree --all --color=always --icons --group-directories-first {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#313244,label:#CDD6F4"
export FZF_TMUX=true
export FZF_DEFAULT_COMAND="fd --hidden --follow --strip-cwd-prefix --exclude .git --exclude node_mocules --exclude vendor --exclude storage --exclude var --exclude .DS_Store"
export FZF_CTRL_T_OPTS="--preview '$SHOW_FILE_OR_DIR_PREVIEW'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
export FZF_TMUX_OPTS=" -p90%,70%"

# NVM
export NVM_DIR="$HOME/.local/share/nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# aliases 
alias -- c=clear
alias -- cat='bat --paging=never --color=always'
alias -- eza='eza --icons=always --color=always --group-directories-first --header'
alias -- g=git
alias -- la='eza -a'
alias -- ll='eza -la'
alias -- l="eza -la"
alias -- ls=eza
alias -- lt='eza --tree'
alias -- lz=lazygit
alias -- tm=tmux
alias -- vimdiff='nvim -d'
alias -- vim='nvim'
alias -- vi='nvim'

