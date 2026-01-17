export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export FUNCNEST=10000
export EDITOR="nvim"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export NVM_COMPLETION=true
export BAT_THEME="Catppuccin Mocha"
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:\
*.tar=01;31:*.zip=01;31:*.7z=01;31:*.rar=01;31:*.gz=01;31:\
*.txt=00;37:*.md=01;38;5;156:\
*.js=01;38;5;221:*.jsx=01;38;5;221:*.ts=01;38;5;111:*.tsx=01;38;5;111:\
*.html=01;38;5;111:*.css=01;38;5;115:*.scss=01;38;5;115:\
*.jpg=01;35:*.png=01;35:*.svg=01;35:*.ico=01;35:\
*.yaml=01;38;5;215:*.yml=01;38;5;215:*.toml=01;38;5;147:*.xml=01;38;5;115:*.json=01;38;5;115:\
*.sql=01;38;5;111:*.csv=01;38;5;115:*.pdf=01;31:\
# Shell Profiles & Scripts (Màu Lavender/Flamingo)
*rc=01;38;5;147:*_profile=01;38;5;147:*_history=00;38;5;245:*.DS_Store=00;38;5;245:*.zcompdump*=00;38;5;245:\
*.sh=01;38;5;147:*.bash=01;38;5;147:*.zsh=01;38;5;147:*.fish=01;38;5;147:*.alias=01;38;5;147:\
# Git & Docker
*.gitignore=00;38;5;245:.git=01;38;5;203:Dockerfile=01;38;5;111:docker-compose.yml=01;38;5;215:"


export BUN_INSTALL="${XDG_DATA_HOME:-${HOME}/.local/share}/bun"
export PATH="$BUN_INSTALL/bin:$PATH"