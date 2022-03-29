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
bindkey "^[[3~" delete-char

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
alias ipa="ip -c a | grep '^[0-9]\+:\|inet' | grep -v LOOPBACK | grep -v 'scope host'"
alias ipr="ip -c -4 route show table all type unicast && echo '---' && ip -c -6 route show table all type unicast | grep -v '::1'"
alias ll='ss -ltupn'
alias ipt="sudo iptables --line-numbers -vnL |\
  sed -E 's/^Chain.*$/\x1b[4m&\x1b[0m/' |\
  sed -E 's/^num.*/\x1b[33m&\x1b[0m/' |\
  sed -E '/(REJECT|DROP)/s//\x1b[31m\1\x1b[37m/' |\
  sed -E '/(INPUT|FORWARD|OUTPUT)/s//\x1b[35m\1\x1b[37m/' |\
  sed -E '/(ACCEPT)/s//\x1b[32m\1\x1b[37m/' |\
  sed -E '/(dpt?:)([[:digit:]]+(:[[:digit:]]+)?)/s//\1\x1b[33;1m\2\x1b[0m/' |\
  sed -E '/(spt?:)([[:digit:]]+(:[[:digit:]]+)?)/s//\1\x1b[33;1m\2\x1b[0m/' |\
  sed -E '/([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}(\/([[:digit:]]){1,3}){0,1}/s//\x1b[36;1m&\x1b[0m/g'"
alias brs='bundle exec rails s'
alias brc='bundle exec rails c'
alias dbm='bundle exec rake db:migrate'
alias gst='git stash'
alias gstp='git stash pop'
alias routes='bundle exec rails routes'
alias phs='mix phoenix.server'
alias fda='fd -HI'
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
  tar cvf $1.tar $1
}

tarz() {
  tar vcf - $1 | zstd -9 > $1.tar.zst
}

tarx() {
  tar xvaf $1
}

l() {
  ls -lvhN --color=always --group-directories-first $1 | tail -n +2
}

la() {
  ls -lAvhN --color=always --group-directories-first $1 | tail -n +2
}

export ERL_AFLAGS="-kernel shell_history enabled"
export EDITOR=vim
export TERM=xterm-256color
export JQ_COLORS='0;31:0;39:0;39:0;39:0;32:1;39:1;39'
