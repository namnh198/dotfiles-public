if [[ -f "/opt/homebrew/bin/brew" ]]; then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# installing zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# installing starship
zinit ice as"command" from"gh-r" \
  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
  atpull"%atclone" src"init.zsh"
zinit light starship/starship

export STARSHIP_CONFIG="${ZDOTDIR}/starship.toml"

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions \
  lukechilds/zsh-nvm

export HISTSIZE=50000
export SAVEHIST=50000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
mkdir -p "$(dirname "$HISTFILE")"

if command -v tmux >/dev/null 2>&1; then
  ide() {
    tmux split-window -v -l 25%
    tmux split-window -h -l 50%
  }
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh --cmd cd)"
fi

if command -v fzf >/dev/null 2>&1; then
  eval "$(fzf --zsh)"
fi

source "$ZDOTDIR/plugins/fzf.zsh"
source "$ZDOTDIR/plugins/aliases.zsh"

# load local aliases if exists
[ -f "${ZDOTDIR}/.aliases" ] && . "${ZDOTDIR}/.aliases"

# bun completions
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"
