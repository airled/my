source ~/.git-prompt.zsh/git-prompt.zsh

autoload -U colors && colors
for color in red green yellow blue magenta cyan black white; do
  eval $color='%{$fg_no_bold[${color}]%}'
done
reset="%{$reset_color%}"

RPS1='$(gitprompt)[${white}%D{%H:%M:%S}]${blue}[%n@%m]${reset}'

if [[ $EUID == 0 ]]; then
  PS1="${red}[%~] # ${reset}";
else
  PS1="${cyan}[%~] > ${reset}";
fi
PROMPT=$PS1

setopt histignorealldups sharehistory
setopt autocd

bindkey -e
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

alias sunits="systemctl list-unit-files -t service --state enabled"
alias sstart="sudo systemctl start"
alias sstop="sudo systemctl stop"
alias srestart="sudo systemctl restart"
alias sdisable="sudo systemctl disable"
alias senable="sudo systemctl enable"
alias sstatus="sudo systemctl status"
alias sshow="sudo systemctl cat"
alias sreload="sudo systemctl daemon-reload"
alias upg='sudo apt update && sudo apt dist-upgrade'
alias l='ls -lAvh --color=auto --group-directories-first'
alias bi='bundle install'
alias bu='bundle update'
alias be='bundle exec'
alias gi='gem install --no-document'
alias gc='git add -A && git commit -m'
alias ga='git add -A'
alias gam='git add -A && git commit --amend'
alias pl='git pull'
alias st='git status -s'
alias ch='git checkout'
alias chb='git checkout -b'
alias chf='git checkout --'
alias br='git branch'
alias di='git diff'
alias di2='git diff HEAD^ HEAD'
alias di2n='git diff HEAD^ HEAD --shortstat --numstat'
alias grl='git reset --soft HEAD^'
alias grm='git rebase main'
alias lg='git log'
alias gcl='git checkout -f && git clean -df'
alias apti='sudo apt install'
alias ipa="ip a | grep '^[0-9]\+:\|inet'"
alias ipr="ip -4 route show table all type unicast && echo '---' && ip -6 route show table all type unicast | grep -v 'dev lo'"
alias ll='ss -ltupn'
alias brs='bundle exec rails s'
alias brc='bundle exec rails c'
alias dbm='bundle exec rake db:migrate'
alias gst='git stash'
alias gstp='git stash pop'
alias routes='bundle exec rails routes'
alias phs='mix phoenix.server'
alias fd='fdfind -HI'
alias dfh='df -hT'
alias tf='tail -f'
alias j='journalctl -fu'
alias dj='sudo docker logs -f -n 10'
alias pp='pipenv run python'
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
#. $HOME/.asdf/asdf.sh
#. $HOME/.asdf/completions/asdf.bash

tarc() {
  tar cvzf $1.tar.gz $1
}

tarx() {
  tar xvaf $1
}

export ERL_AFLAGS="-kernel shell_history enabled"
export EDITOR=vim
export TERM=xterm-256color
