source /home/air/zsh-git-prompt/zshrc.sh
GIT_PROMPT_EXECUTABLE="haskell"

autoload -U colors && colors
for color in red green yellow blue magenta cyan black white; do
  eval $color='%{$fg_no_bold[${color}]%}'
  #eval ${color}_bold='%{$fg_bold[${color}]%}'
done
reset="%{$reset_color%}"

RPS1='$(git_super_status)${reset}${blue}[%n@%m]${reset}'

if [[ $EUID == 0 ]]; then
  PS1="${red}[%~] # ${reset}";
else
  PS1="${green}[%~] > ${reset}";
fi
PROMPT=$PS1

setopt histignorealldups sharehistory
bindkey -e

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias upd='sudo apt-get update'
alias upg='sudo apt-get dist-upgrade'
alias cls='clear'
alias la='ls -la --color=auto --group-directories-first'
alias bi='bundle install'
alias be='bundle exec'
alias mgo='sudo service mysql start'
alias mst='sudo service mysql stop'
alias gp='git add -A && git commit && git push'
alias gc='git add -A && git commit'
alias ga='git add -A'
alias gam='git commit --amend'
alias pl='git pull'
alias st='git status'
alias ch='git checkout'
alias br='git branch'
alias di='git diff'
alias gcl='git checkout -f && git clean -df'
alias ru='rackup'
alias s='ssh s'
alias cb='crystal build'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
