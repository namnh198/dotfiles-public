export FZF_TMUX=true
export FZF_CTRL_T_COMMAND="fd --type f --hidden"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always --group-directories-first {} | head -200'"
export FZF_ALT_C_COMMAND="fd --type d --hidden"

zinit snippet https://raw.githubusercontent.com/catppuccin/fzf/refs/heads/main/themes/catppuccin-fzf-mocha.sh

zinit wait lucid light-mode for Aloxaf/fzf-tab 

# fzf-tab settings
setopt GLOB_DOTS
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --all --group-directories-first $realpath'
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
