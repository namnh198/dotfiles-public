alias c=clear
alias g=git

if command -v bat >/dev/null 2>&1; then
  alias cat='bat --paging=never --color=always'
fi

# eza
if command -v eza >/dev/null 2>&1; then
  alias eza='eza --icons=always --color=always --group-directories-first --header'
  alias la='eza -a'
  alias ll='eza -la'
  alias l="eza -la"
  alias ls=eza
  alias lt='eza --tree'
else
  alias la='ls -a'
  alias ll='ls -la'
  alias l="ls -la"
fi

alias lz=lazygit
alias tm=tmux

if command -v nvim >/dev/null 2>&1; then
  alias vimdiff='nvim -d'
  alias vim='nvim'
  alias vi='nvim'
fi
