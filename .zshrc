source ~/.zsh-git-prompt/zshrc.sh
#GIT_PROMPT_EXECUTABLE="haskell"

autoload -U colors && colors
for color in red green yellow blue magenta cyan black white; do
  eval $color='%{$fg_no_bold[${color}]%}'
done
reset="%{$reset_color%}"

# RPS1='$(git_super_status)${blue}[%n@%m]${reset}'
RPS1='$(git_super_status)[${white}%D{%H:%M:%S}]${blue}[%n@%m]${reset}'

if [[ $EUID == 0 ]]; then
  PS1="${red}[%~] # ${reset}";
else
  PS1="${cyan}[%~] > ${reset}";
fi
PROMPT=$PS1

setopt histignorealldups sharehistory
bindkey -e

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

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

alias upg='sudo apt update && sudo apt dist-upgrade'
alias cls='clear'
alias la='ls -la --color=auto --group-directories-first'
alias bi='bundle install'
alias be='bundle exec'
alias gi='gem install --no-ri --no-rdoc'
alias gp='git add -A && git commit && git push'
alias gc='git add -A && git commit'
alias ga='git add -A'
alias gam='git add -A && git commit --amend'
alias pl='git pull'
alias st='git status'
alias ch='git checkout'
alias ch='git checkout -b'
alias chf='git checkout --'
alias br='git branch'
alias bch='git checkout -b'
alias di='git diff'
alias di2='git diff HEAD^ HEAD'
alias grl='git reset --soft HEAD^'
alias grm='git rebase master'
alias gpfwl='git push --force-with-lease'
alias lg='git log'
alias gcl='git checkout -f && git clean -df'
alias ru='rackup'
alias s='ssh s'
#alias cb='crystal build'
#alias cr='crystal run'
alias apti='sudo apt install'
alias ll='sudo netstat -lptn4'
alias smc='sudo mc'
alias duh='du -hs .*; du -hs *'
alias pa='ps -ef'
alias ngr='ngrok http'
alias bps='bundle exec padrino s'
alias bpc='bundle exec padrino c'
alias brs='bundle exec rails s'
alias brc='bundle exec rails c'
alias dbm='bundle exec rake db:migrate'
alias dbr='bundle exec rake db:rollback'
alias gst='git stash'
alias gstp='git stash pop'
alias kl='sudo kill -9'
alias routes='bundle exec rake routes'
alias phs='mix phoenix.server'
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# export PATH="$HOME/.crenv/bin:$PATH"
# eval "$(crenv init -)"
