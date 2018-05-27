# Plugins {{{
# source ~/prompt.zsh
source ~/dev/pure/async.zsh
source ~/dev/pure/pure.zsh
source ~/dev/z/z.sh
source ~/dev/k/k.sh
source ~/dev/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dev/bam-pow/bam.sh
source ~/dev/bam-pow/pow.sh
# }}}
# Load {{{
autoload -U run-help
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
autoload -U compinit
compinit
# }}}
# Zsh setopt {{{
setopt auto_cd
setopt auto_pushd
setopt dotglob
setopt ignoreeof
setopt pushd_ignore_dups
setopt pushdminus

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history
# }}}
# Exports + PATH {{{
export EDITOR=vim
export VISUAL=$EDITOR
export BACKGROUND=light

# mac style
export LSCOLORS=exfxcxdxbxegedabagacad
# linux style
export LS_COLORS='di=0;34:ln=0;35:so=0;32:pi=0;33:ex=0;31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

export LESS='-RFX'
export ZDOTDIR=$HOME

export LESS_TERMCAP_mb=$'\E[3;31m'
export LESS_TERMCAP_md=$'\E[1;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;05;00;48;05;03m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;34m'

export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/bin
export PATH=$PATH:/sbin

export PATH=$PATH:$HOME/dev/lm
export PATH=$PATH:$HOME/dev/git-open/
export PATH=$PATH:$HOME/dev/git-more
export PATH=$PATH:$HOME/dev/depot_tools/

export PATH=$PATH:/usr/local/lib/ruby/gems/2.2.0/bin/
export PATH=$PATH:/Users/george.crabtree/.gem/ruby/2.2.0/bin
export PATH=$PATH:/usr/local/Cellar/ruby22/2.2.5_2/lib/ruby/gems/2.2.0/bin

export BAM_DIR="$HOME/dev/scratches"
export POW_DIR="$HOME/dev/powder"
# }}}
# Misc {{{
# stop control flow, gimme ctrl-s back
stty -ixon

# history settings
HISTFILE=$HOME/.zsh_history
HISTSIZE=200000
SAVEHIST=200000

# using the homebrew version of zsh, so point at their docs
HELPDIR=/usr/local/share/zsh/help

_Z_DATA=~/.z.data/.z

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=blue'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=blue'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=blue'

test -e "$HOME/.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh"

# }}}
# Z Style {{{
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select
# }}}
# New Keyboard Shortcuts {{{
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

zle -N fancy-branch
bindkey '^ ' fancy-branch

zle -N up-line-or-beginning-search
zle -N searchup
bindkey "^p" searchup

zle -N down-line-or-beginning-search
zle -N searchdown
bindkey "^n" searchdown

zle -N aliasexpander
bindkey " " aliasexpander

zle      -N  fzf-history-widget
bindkey '^R' fzf-history-widget

# zle -N command-palette
# bindkey '^ ' command-palette
# }}}
# Aliases {{{
unalias run-help
alias man='run-help'
alias l='/usr/local/bin/gls --group-directories-first -A --color'
alias ll='lm'
alias t='tree -a -I "node_modules|.git|.DS_Store|bower_components|dist|build"'
alias rm='trash'

alias download-video-as-audio='youtube-dl -x --audio-format=mp3'

alias vanillavim='command vim -u NONE'
alias vi="$EDITOR"
alias vimrc="$EDITOR $HOME/dev/dotfiles/.vimrc"
alias zshrc="$EDITOR $HOME/dev/dotfiles/.zshrc"
alias json='joli -o inspect'
alias jsonp='pbpaste | joli -o inspect'
# alias ls='live-server | sed -e "s/\(http:\/\/127.0.0.1:\)\([0-9]*\)/\1\2 http:\/\/$(ipconfig getifaddr en0):\2/"'

alias g=magic-g
alias gg='git remote -v | column -t'
alias gdm='g-diff-mega'
alias gc='git commit'
alias gl='echo "\n" && git log -z --pretty=stacked -20'
alias gla='echo "\n" && git log -z --pretty=stacked --all -20'
alias glnm='echo "\n" && git log -z --pretty=stacked --no-merges -20'
alias glanm='echo "\n" && git log -z --pretty=stacked --all --no-merges-20'
alias d='standard-diff'
alias D='git diff --staged'
alias ds="git diff --stat"
alias DS="git diff --staged --stat"
alias gvim='git-files-vim'
alias cvim='git mergetool --no-prompt'
alias svim='vim `git diff --name-only --diff-filter=d --staged`'

aliasestoexpand=(
  'l'
  'download-video-as-audio'
  'vanillavim'
  't'
  'gg'
  'gc'
  'gcf'
  'gl'
  'gla'
  'glnm'
  'glanm'
  'ds'
  'D'
  'DS'
  'cvim'
  'svim'
  'rm'
)

alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# suffix
alias -s git='git clone'

# global
alias -g UP='@{u}'
alias -g IN='..@{u}'
alias -g OUT='@{u}..'
# }}}
# ZLE Functions {{{
searchup() {
  zle up-line-or-beginning-search
  _zsh_highlight
}
searchdown() {
  zle down-line-or-beginning-search
  _zsh_highlight
}

aliasexpander() {
  # expand aliases listed in $aliasestoexpand
  for a in ${aliasestoexpand}; do
      if [[ $LBUFFER =~ "^$a$" ]]; then
        zle _expand_alias
        zle expand-word
      fi
  done
  # expand all global aliases
  if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
    zle _expand_alias
    zle expand-word
  fi
  zle self-insert
}

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER='fg'
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
# }}}
# Standard Functions {{{
cdwhich() {
  cd "$(dirname $(which $1))"
}

mkcd() {
  mkdir -p $1 && cd $1
}

jobcount() {
  local jobs=$(jobs | grep ^\\\[ | wc -l | xargs)
  ((jobs)) && echo -n "$jobs "
}

# command-palette() {
#   local cmd=`cat ~/.commands | awk -F " ## " '! /(^\s*$|^#)/{print "\x1b[32;1m" $1 "\x1b[37m ## " $2 "\x1b[m"}' | fzf -e -s --ansi | awk -F " ## " '{print $2}'`
#   if [[ -n "$cmd" ]]; then
#     local output=`eval "$cmd"`
#     LBUFFER="$LBUFFER$output"
#   fi
# }

colortest() {
  echo -e "\n                 40m     41m     42m     43m\
       44m     45m     46m     47m";

  for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
             '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
             '  36m' '1;36m' '  37m' '1;37m';
    do FG=${FGs// /}
    echo -en " $FGs \033[$FG  gYw  "
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
      do echo -en "$EINS \033[$FG\033[$BG  gYw  \033[0m";
    done
    echo;
  done
  echo
}
# }}}
# Git things {{{
magic-g() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    local remote_branch=$(git rev-parse --abbrev-ref @{u} 2> /dev/null | sed 's|/.*||')
    local remote_url=$(git remote get-url $remote_branch 2> /dev/null)
    git -c color.ui=always status -sb | sed "1 s,$, => $remote_url,"
  else
    lm
  fi
}

# if a ref is passed and -s flag open the files in that ref
# if a ref is passed `gvim @{REF}` open the files that differ between HEAD and @{REF}
# otherwise open any files that have been edited, or are new and untracked.
# otherwise if working directory is clean, open files edited in last commit.
git-files-vim() {
  if [[ "$1" == '-s' ]]; then
      if [[ "$2" == '' ]]; then
        vim $(git show --name-only --diff-filter=d --pretty=)
      else
        vim $(git show --name-only --diff-filter=d --pretty= "$2")
      fi
  else
    if [ $1 ]; then
      vim $(git diff --name-only --diff-filter=d "$1"...)
    else
      local files=$(git ls-files -m && git ls-files -o --exclude-standard && git diff --cached --name-only --diff-filter=d)
      if [[ $files != "" ]]; then
        vim $(git ls-files -m && git ls-files -o --exclude-standard && git diff --cached --name-only --diff-filter=d)
      else
        vim $(git show --name-only --diff-filter=d --pretty=)
      fi
    fi
  fi
}

# git diff
standard-diff() {
  if test "$#" = 0; then
    (
    git diff --color | diff-so-fancy
    git ls-files --others --exclude-standard | while read -r i; do git diff --color -- /dev/null "$i" | diff-so-fancy; done
    ) | less
  else
    git diff "$@"
  fi
}

g-diff-mega() {
  vim -p $(git diff --name-only $1) -c "tabdo :Gdiff $1" -c "tabdo :norm gg0" -c "tabdo :wincmd h" -c "tabdo :norm gg0" -c "tabfirst"
}

# completion for git functions
# `alias __git-diff_main=_git_diff` is a hacky edit to get around ... something weird to do with git, hub, zsh, brew?
# https://github.com/robbyrussell/oh-my-zsh/issues/2394#issuecomment-45287624
# alias __git-diff_main=_git_diff
# compdef _git standard-diff=git-diff
# compdef g git
# }}}
# FZF things {{{
export FZF_DEFAULT_OPTS="--extended --reverse --multi --cycle\
  --bind=ctrl-d:half-page-down,ctrl-u:half-page-up\
  --color=fg:8,fg+:-1,bg:-1,bg+:-1,hl:0,hl+:3,prompt:2,marker:2,pointer:2,info:9"

fzf-history-widget() {
  local selected num
  selected=( $(fc -l 1 | tail -r | awk '!seen[$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20]++' | fzf +s +m -n2..,.. --no-reverse --tiebreak=index --exact --toggle-sort=ctrl-r -q "${LBUFFER//$/\\$}") )
  if [ -n "$selected" ]; then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle redisplay
}

fancy-branch() {
  local awk_coloring='BEGIN { prev=""; color=0; } ! /^$/ { first=$1; $1 = ""; if (prev != first) { color=(color + 1) % 6; prev=first; } print "\x1b[3" color ";1m" first "\x1b[m\t" $0; }'
  local other_coloring='{print "\x1b[" color ";1m" text "\x1b[m\t" $1}'

  local local_branches=`git branch --sort=-committerdate | cut -c 3- | grep -vE 'HEAD' | awk -v color=36 -v text="local" $other_coloring`
  local remote_branches=`git branch -r | grep -vE 'HEAD|--hooks--' | cut -c 3-`
  local tags=`git tag -l --sort=-taggerdate | awk -v color=37 -v text="tags" $other_coloring`

  local origin=`printf $remote_branches | grep '^\s*origin/'`
  local other=`printf $remote_branches | grep -v '^\s*origin/'`
  local remote_sorted=`printf "$origin\n$other" | awk -F "/" $awk_coloring`

  local selected=`echo "$local_branches\n$remote_sorted\n$tags" | column -t | sed '/^$/d' | fzf --no-hscroll --ansi +m -d "\t"`

  if [[ -n "$selected" ]]; then
    local type=`printf $selected | awk '{print $1}'`
    local target=`printf $selected | awk '{print $2}'`

    if [[ "$type" != "local" && "$type" != "origin" ]]; then
      target=`print $type/$target`
    fi

    if [[ -z "$LBUFFER" ]]; then
        LBUFFER="git checkout $target"
    else
        LBUFFER="$LBUFFER$target"
    fi
  fi
}

unalias z 2> /dev/null
z() {
  if [[ -z "$*" ]]; then
    cd "$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
  else
    _z "$@"
  fi
}

# }}}
# rbenv {{{
# eval "$(rbenv init - --no-rehash)"
# }}}
# nvm {{{
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(whence -w __init_nvm)" = function ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')
  function __init_nvm() {
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR"/nvm.sh
    unset __node_commands
    unset -f __init_nvm
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi
# }}}
