# [ -f ~/.zshrc-pre ] && source ~/.zshrc-pre

# Plugins
# ------------------------------------------------------------------------------
source ~/.zplug/zplug

zplug "rupa/z", use:z.sh
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "k4rthik/git-cal", as:command
zplug "robbyrussell/oh-my-zsh", use:plugins/sudo/sudo.plugin.zsh
zplug "zsh-users/zsh-completions"
zplug "mafredri/zsh-async"
zplug "so-fancy/diff-so-fancy", as:command
zplug "supercrabtree/bam-pow", use:bam.sh
zplug "supercrabtree/k"
zplug "paulirish/git-open", as:command


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

zplug load

# easier to work on / see pr's
# source ~/dev/k/k.sh
source ~/dev/pure/pure.zsh
source ~/dev/scratch/scratch
# alias k="~/dev/knode/index.js"


# Load
# ------------------------------------------------------------------------------
autoload -U run-help
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
# zmodload -i zsh/parameter


# Zsh options
# ------------------------------------------------------------------------------
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt dotglob

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history
setopt ignoreeof


# Exports
# ------------------------------------------------------------------------------
export VISUAL=vim
export EDITOR=vim
export BACKGROUND=light

# mac style
export LSCOLORS=exfxcxdxbxegedabagacad
# linux style
export LS_COLORS='di=0;34:ln=0;35:so=0;32:pi=0;33:ex=0;31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

export LESS="-RFX"
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='43;0'
export ZDOTDIR=$HOME

export BAM_DIR="$HOME/dev/scratches"
export POW_DIR="$HOME/dev"

export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;05;00;48;05;03m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;34m'

export PATH=$PATH:~/.rvm/bin
export PATH=$PATH:~/.npm/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin
export PATH=$PATH:~/bin
export PATH=$PATH:~/git-functions

export PATH=$PATH:~/dev/git-more
export PATH=$PATH:~/dev/ubik-cli


# Misc
# ------------------------------------------------------------------------------
# stop control flow, gimme ctrl-s back
bindkey -r '\C-s'
stty -ixon
setopt noflowcontrol

# history settings
HISTFILE=$HOME/.zsh_history
HISTSIZE=200000
SAVEHIST=100000

# using the homebrew version of zsh, so point at their docs
HELPDIR=/usr/local/share/zsh/help

source <(npm completion)

_Z_DATA=~/.z.data/.z

git_log_defaults="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%<(50,trunc)%s %Creset%<(15,trunc)%cn"


# Z Style
# ------------------------------------------------------------------------------
zstyle ':completion:*'         list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:*:*:*' menu select


# New Keyboard Shortcuts
# ------------------------------------------------------------------------------
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

zle -N fancy-ctrl-q
bindkey '^Q' fancy-ctrl-q

zle -N fancy-branch
bindkey '^b' fancy-branch

zle -N up-line-or-beginning-search
zle -N searchup
bindkey "^[[A" searchup

zle -N down-line-or-beginning-search
zle -N searchdown
bindkey "^[[B" searchdown

zle -N insert-last-command-output
bindkey "^d" insert-last-command-output

zle -N first-tab
bindkey '^I' first-tab

zle -N switch-background
bindkey -r '^_'
bindkey '^_' switch-background

zle -N globalaliasexpander
bindkey " " globalaliasexpander
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches

zle -N vim-pop
bindkey "^V" vim-pop


# Aliases
# ------------------------------------------------------------------------------
unalias run-help
alias man="run-help"
alias l="ls -laG"
alias e="exa --level=2 -T -la"
alias vi="env vim"

alias dev="cd ~/dev"
alias f="open ."
alias reload="exec zsh"
alias download-video="youtube-dl -o -x \"~/dl/%(title)s.%(ext)s\""
alias download="youtube-dl -o \"~/dl/%(title)s.%(ext)s\""

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias clearvim="rm -rf ~/.vim/tmp/*"
alias vimrc="vim ~/dev/dotfiles/.vimrc"
alias zshrc="vim ~/dev/dotfiles/.zshrc"

alias jsonp='pbpaste | joli -o inspect'
alias json='joli -o inspect'

alias glg="git log --graph --decorate --all --pretty='$git_log_defaults%C(auto)%d'"
alias grc='git add -A && git rebase --continue'
alias gaa='git add -A'
alias fk='fuck'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'

alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'

# suffix
alias -s git='git clone'
alias -s md='md'
alias -s markdown='md'
alias -s mdown='md'
alias -s mkdn='md'
alias -s mkd='md'
alias -s mdwn='md'
alias -s mdtxt='md'
alias -s mdtext='md'

# global
alias -g C='| pbcopy'
alias -g G='| grep -i '
alias -g F='| fzf --ansi'
alias -g L='| less'
alias -g J='| json'


# ZLE Functions
# ------------------------------------------------------------------------------
searchup() {
  zle up-line-or-beginning-search
  _zsh_highlight
}
searchdown() {
  zle down-line-or-beginning-search
  _zsh_highlight
}

# standard Functions
# ------------------------------------------------------------------------------
cdwhich() {
  cd "$(dirname $(which $1))"
}

mkcd() {
  mkdir -p $1 && cd $1
}

# No arguments: `git status -s`
# With arguments: acts like `git`
compdef g=git
g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status -s
  fi
}

md(){
  if [ $# -ge 1 -a -f "$1" ]; then
    pandoc -s -f markdown_github -t man "$*" | groff -T utf8 -man | less
  else
    pandoc -s -f markdown_github -t man | groff -T utf8 -man | less
  fi
}

vim() {
  local currentPath="$(pwd)"
  currentPath=${currentPath#?}
  currentPath=${currentPath//\//-}

  if test $# -gt 0; then
    env vim -c "silent Obsession ~/.vim/session/$currentPath/Session.vim" "$@"
  elif test -f "$HOME/.vim/session/$currentPath/Session.vim"; then
    env vim -S "$HOME/.vim/session/$currentPath/Session.vim" "$@"
  else
    mkdir -p "$HOME/.vim/session/$currentPath"
    env vim -c "silent Obsession ~/.vim/session/$currentPath/Session.vim" "$@"
  fi
}

gc() {
  if [[ $@ == "-vp" ]]; then
    clear && git commit -vp
  else
    git commit "$@"
  fi
}

switch-background () {
  if [[ $BACKGROUND == "dark" ]]; then
    export BACKGROUND="light"
    echo -e "\033]50;SetProfile=supercrabtree-light\a             ┬─┬ ︵ ノ(°_° ノ)"
    zle reset-prompt
  else
    export BACKGROUND="dark"
    echo -e "\033]50;SetProfile=supercrabtree-dark\a(╯°□°)╯︵ ┻━┻"
    zle reset-prompt
  fi
}

globalaliasexpander() {
  if [[ $LBUFFER =~ " [A-Z0-9]+$" ]]; then
    zle _expand_alias
    zle expand-word
  fi
  zle self-insert
}

first-tab() {
  if [[ $#BUFFER == 0 ]]; then
    BUFFER="cd "
    CURSOR=3
    zle list-choices
  else
    zle expand-or-complete
  fi
}


# open any files that have been edited, or are new and untracked.
# if working directory is clean, open files edited in last commit.
gvim() {
  local files=$(git ls-files -m && git ls-files -o --exclude-standard)
  if [[ $files != "" ]]; then
    vim $(git ls-files -m && git ls-files -o --exclude-standard)
  else
    echo '\nCommits' && git log @{1}.. --decorate --pretty="$git_log_defaults" && echo '\nFiles' && git diff --stat @{1}..
    echo '\nPress any key open these files'; read -k1 -s
    vim $(git diff --name-only @{1}..)
  fi
}

# conflict vim
cvim() {
  vim $(git diff --name-only --diff-filter=u)
}

ff() {
  if [ $1 ]; then
    if [ $2 ]; then
      find $1 | grep $2
    else
      find . | grep $1
    fi
  else
    find .
  fi
}

gl() {
  LINES=20
  if [ $1 ]; then
    LINES=$1
  fi
  git log --decorate --all --pretty="$git_log_defaults" "-$LINES"
}

glb() {
  LINES=20
  if [ $1 ]; then
    LINES=$1
  fi
  git log --decorate --pretty="$git_log_defaults%C(auto)%d" "-$LINES"
}

pr() {
  echo
  echo "Are you sure? Have you tested in Chrome, IE9-11, Safari and Firefox?"
  echo

  read "REPLY?Press [y] to continue "
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    hub pull-request -m $CURRENT_BRANCH -b "dev" -h $CURRENT_BRANCH
  fi
}

colortest() {
  if [ $1 ]; then
    for i in $@; do
      echo -en "\033[48;5;${i}m  \033[m "
    done
  else
    echo -en "\n   +  "
    for i in {0..35}; do
      printf "%2b " $i
    done
    printf "\n\n %3b  " 0
    for i in {0..15}; do
      echo -en "\033[48;5;${i}m  \033[m "
    done
    #for i in 16 52 88 124 160 196 232; do
    for i in {0..6}; do
      let "i = i*36 +16"
      printf "\n\n %3b  " $i
      for j in {0..35}; do
        let "val = i+j"
        echo -en "\033[48;5;${val}m  \033[m "
      done
    done
  fi
}

vim-pop() {
  [[ -z $BUFFER ]] && zle up-history
  if [[ $BUFFER == vim\ * ]]; then
    LBUFFER="${LBUFFER#sudo }"
  else
    LBUFFER="vim $LBUFFER"
  fi
}

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

fancy-ctrl-q () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="vim"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

d() {
  if test "$#" = 0; then
    (
      git diff --color | diff-so-fancy
      git ls-files --others --exclude-standard | while read -r i; do git diff --color -- /dev/null "$i" | diff-so-fancy; done
    ) | less
  else
    git diff "$@"
  fi
}

D() {
  git diff --staged --color | diff-so-fancy | less
}

# use with ctrl-d as a zle binding above
insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
  _zsh_highlight
}

# FZF functions
# ------------------------------------------------------------------------------
export FZF_DEFAULT_OPTS="--extended --reverse --multi --cycle\
  --bind=ctrl-n:toggle-down\
  --color=fg:8,fg+:-1,bg:-1,bg+:-1,hl:4,hl+:2,prompt:2,marker:2,pointer:2,info:9"

__fsel() {
  local cmd="${FZF_CTRL_T_COMMAND:-"command find -L . \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | sed 1d | cut -b3-"}"
  eval "$cmd" | fzf -m | while read item; do
  printf '%q ' "$item"
done
echo
}

fzf-file-widget() {
  LBUFFER="${LBUFFER}$(__fsel)"
  zle redisplay
}

fzf-history-widget() {
  local selected num fade
  if [[ $BACKGROUND == "dark" ]]; then fade=0 fi
  if [[ $BACKGROUND == "light" ]]; then fade=15 fi
  # --color=spinner:"$fade",info:"$fade"
  selected=( $(fc -l 1 | tail -r | awk '!seen[$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20]++' | fzf +s +m -n2..,.. --no-reverse --tiebreak=index --toggle-sort=ctrl-r -q "${LBUFFER//$/\\$}") )
  if [ -n "$selected" ]; then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle redisplay
}

# chrome history to fzf
c() {
  local cols sep
  export cols=$(( COLUMNS / 3 ))
  export sep='{::}'

  cp -f ~/Library/Application\ Support/Google/Chrome/Profile\ 1/History /tmp/h
  sqlite3 -separator $sep /tmp/h \
    "select title, url from urls order by last_visit_time desc" |
  ruby -ne '
    cols = ENV["cols"].to_i
    title, url = $_.split(ENV["sep"])
    len = 0
    puts "\x1b[36m" + title.each_char.take_while { |e|
      if len < cols
        len += e =~ /\p{Han}|\p{Katakana}|\p{Hiragana}|\p{Hangul}/ ? 2 : 1
      end
    }.join + " " * (2 + cols - len) + "\x1b[m" + url' |
  fzf --ansi --multi --no-hscroll --tiebreak=index |
  sed 's#.*\(https*://\)#\1#' | xargs open
}

fancy-branch() {
  local tags localbranches remotebranches target
  tags=$(
  git tag | awk '{print "\x1b[33;1mtag\x1b[m\t" $1}') || return
  localbranches=$(
  git for-each-ref --sort=-committerdate refs/heads/ |
  sed 's|.*refs/heads/||' |
  awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  remotebranches=$(
  git branch --remote | grep -v HEAD             |
  sed "s/.* //"       | sed "s#remotes/[^/]*/##" |
  sort -u             | awk '{print "\x1b[31;1mremote\x1b[m\t" $1}') || return
  target=$(
  (echo "$localbranches"; echo "$tags"; echo "$remotebranches";) |
  fzf --no-hscroll --ansi +m -d "\t" -n 2) || return
  if [[ -z "$BUFFER" ]]; then
    if [[ $(echo "$target" | awk '{print $1}') == 'remote' ]]; then
      target=$(echo "$target" | awk '{print $2}' | sed 's|.*/||')
      git checkout "$target"
      zle accept-line
    else
      git checkout $(echo "$target" | awk '{print $2}')
      zle accept-line
    fi
  else
    res=$(echo "$target" | awk '{print $2}')
    LBUFFER="$(echo "$LBUFFER" | xargs) ${res}"
    zle redisplay
  fi
}

killprocess() {
  pid=$(ps -ef | sed 1d | fzf -m -e | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

killport() {
  pid=$(lsof -P | fzf -e | awk '{print $2}')
  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
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


# FZF
# ------------------------------------------------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export  FZF_COMPLETION_TRIGGER=''
zle      -N  fzf-history-widget
zle      -N  fzf-file-widget
bindkey '^R' fzf-history-widget
bindkey '^F' fzf-file-widget
bindkey '^I' $fzf_default_completion

eval "$(thefuck --alias)"

[ -f ~/.zshrc-post ] && source ~/.zshrc-post

