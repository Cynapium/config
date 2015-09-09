##############################################################################
# General configuration
##############################################################################

# Tools
export PAGER="most"
export EDITOR="vim"
export NNTPSERVER='news.epita.fr'
export TERMINAL=urxvt-unicode-256color

# History
HISTFILE=~/.zsh_histfile
HISTSIZE=4096
SAVEHIST=4096
setopt appendhistory autocd

# Compinit
autoload -Uz compinit && compinit
zstyle :compinstall filename '/home/cynapium/.zshrc'


##############################################################################
# Prompt
##############################################################################

PROMPT="%(!.%F{red}%B.%F{blue})%n%f@%F{white}%B%M%b%(!.%b.)%f:%F{blue}%~%f%(?.%F{green}.%B%F{red})%#%f%b "
RPROMPT='%(?.%F{green}:).%F{red}%B%?)%f'
setopt nopromptcr


##############################################################################
# Aliases
##############################################################################

# List directories
alias ls='ls --color=auto -F -h'
alias ll='ls -lhX'
alias l='ll'
alias la='ls -A'
alias tree='tree -C' 				# Enable colors in tree

# Editors
alias emacs='emacs -nw'
alias e='emacs -nw'
alias v='vim'

# Git
alias ga='git add'
alias gq='git add'
alias gr='git rm'
alias gc='git commit -m'
alias gac='git commit -am'
alias gp='git push'
alias gl='git pull'
alias gb='git branch'
alias gk='git checkout'
alias gs='git status'
alias gg='git log'
alias gd='git diff'
alias gnb='git shortlog -ns'

# Lazy change of directory
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Networks
alias ns='sudo netctl start stevens'
alias nh='sudo netctl start home'

# Others
alias df='df -h'
alias yaourt='yaourt --noconfirm'
alias n='sudo netctl start'


##############################################################################
# Keyboard
##############################################################################

# Fix
bindkey -e
bindkey '^W' vi-backward-kill-word
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '[D' emacs-backward-word
bindkey '[C' emacs-forward-word
