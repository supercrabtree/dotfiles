# [ -f ~/.zshrc-pre ] && source ~/.zshrc-pre

# Plugins
# ------------------------------------------------------------------------------
source ~/.zplug/zplug

zplug "rupa/z", of:z.sh
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "knu/zsh-manydots-magic", of:manydots-magic, nice:11
zplug "k4rthik/git-cal", as:command
zplug "robbyrussell/oh-my-zsh", of:plugins/sudo/sudo.plugin.zsh
zplug "djui/alias-tips"
zplug "zsh-users/zsh-completions"
zplug "mafredri/zsh-async"
zplug "so-fancy/diff-so-fancy", as:command
zplug "so-fancy/diff-so-fancy", from:gist
zplug "supercrabtree/pure"

# zplug "pixelb/scripts", of:scripts/l

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
source ~/dev/k/k.sh
# source ~/dev/pure/pure.zsh


# Load
# ------------------------------------------------------------------------------
autoload -U run-help
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zmodload -i zsh/parameter


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
export BACKGROUND=dark
export LSCOLORS=exfxcxdxbxegedabagacad
# export LS_COLORS='di=0;34:ln=0;35:so=0;32:pi=0;33:ex=0;31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

export ZSH_PLUGINS_ALIAS_TIPS_TEXT="(╯°□°）╯︵ ┻━┻ "
export PROTOTYPE_FOLDER=~/dev/yeah

export LESS="-RFX"
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='0;33'

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

git_log_defaults="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%<(70,trunc)%s %Creset%<(15,trunc)%cn%C(auto)%d"


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


# stop my single tap caps-lock from echoing 7;2~
bindkey -s "^[[17;2~" ""


# Aliases
# ------------------------------------------------------------------------------
unalias run-help
alias man="run-help"
alias k="k -a"
alias l="k -a --no-vcs"
alias l="ls -laG"
alias e="exa --level=2 -T -la"

alias dev="cd ~/dev"
alias f="open ."
alias reload="exec zsh"
alias nw="/Applications/node-webkit.app/Contents/MacOS/node-webkit ."
alias download-video="youtube-dl -o -x \"~/dl/%(title)s.%(ext)s\""
alias download="youtube-dl -o \"~/dl/%(title)s.%(ext)s\""

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias clearvim="rm -rf ~/.vim/tmp/*"
alias vimrc="vim ~/dev/dotfiles/.vimrc"
alias zshrc="vim ~/dev/dotfiles/.zshrc"

alias run="./run"
alias build="./build"
alias deploy="./deploy"
alias setup="./setup"

alias glg="git log --graph --decorate --all --pretty='$git_log_defaults'"
alias grc='git add -A && git rebase --continue'
alias gaa='git add -A'

# suffix
alias -s git='git clone'

# global
alias -g C='| pbcopy'
alias -g G='| grep -i '
alias -g F='| fzf --ansi'
alias -g L='| less'


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

git-mini-log() {
  git log --pretty=format:"%C(3)%h%C(5) %<(8,trunc)%an %C(10)%ad %Creset%<(50,trunc)%s" --date=format:%d/%m/%y "$@"
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
    BACKGROUND="light"
    echo -e "\033]50;SetProfile=supercrabtree-light\a             ┬─┬ ︵ ノ(°_° ノ)"
    zle reset-prompt
  else
    BACKGROUND="dark"
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


# open any files that have been edited, or are new and untracked.t 
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
  git log --decorate --pretty="$git_log_defaults" "-$LINES"
}

killport() {
  PORT=$1
  lsof -P | grep ':$PORT' | awk '{print $2}' | xargs kill -9
}

pr() {
  echo
  echo "Are you sure? Have you tested in Chrome, IE9-11, Safari and Firefox?"
  echo

  read "REPLY?Press [y] to continue "
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    hub pull-request -m $CURRENT_BRANCH -b "dev" -h $CURRENT_BRANCH | pbcopy
  fi
}

mygit() {
  if [ -f './.git/config' ];
  then
    git config user.name "George Crabtree" || { return 1; }
    git config user.email supercrabtree@googlemail.com || { return 1; }
    echo "\nSetting local Git Config\nUsername: \033[0;34mGeorge Crabtree\033[0m\nEmail: \033[0;34msupercrabtree@googlemail.com\033[0m\n"
  else
    echo "\n\033[0;31mNo git repository found in this directory.\033[0m\n"
    return 1;
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

# Serve some static stuff from CWD fast
serve() {
  PORT=8001
  if [ "$1" != "" ]; then
    PORT=$1
  fi
  python -m SimpleHTTPServer $PORT
  open "http://localhost:$PORT"
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
    BUFFER="vim -S"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

function pfd() {
  osascript 2>/dev/null <<EOF
    tell application "Finder"
      return POSIX path of (target of window 1 as alias)
    end tell
EOF
}

function fp() {
  cd "$(pfd)"
}

function fpf() {
  osascript 2>/dev/null <<EOF
    set output to ""
    tell application "Finder" to set the_selection to selection
    set item_count to count the_selection
    repeat with item_index from 1 to count the_selection
      if item_index is less than item_count then set the_delimiter to "\n"
      if item_index is item_count then set the_delimiter to ""
      set output to output & ((item item_index of the_selection as alias)'s POSIX path) & the_delimiter
    end repeat
EOF
}

d() {
  if test "$#" = 0; then
    (
      git diff --color | diff-so-fancy
      echo
      git ls-files --others --exclude-standard | while read -r i; do git diff --color -- /dev/null "$i" | diff-so-fancy; done
    ) | less -R
  else
    git diff "$@"
  fi
}

# Use Ctrl-x,Ctrl-l to get the output of the last command
insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
  _zsh_highlight
}

# FZF functions
# ------------------------------------------------------------------------------
export FZF_DEFAULT_OPTS="--extended --reverse --multi --cycle\
  --bind=ctrl-n:toggle-down\
  --color=fg:8,fg+:-1,bg:-1,bg+:-1,hl:4,hl+:2,prompt:2,marker:2,pointer:2,info:9"

# CTRL-T - Paste the selected file path(s) into the command line
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

# fshow - git commit browser
fshow() {
  local out shas sha q k
  while out=$(
    git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
    fzf --ansi --multi --no-sort --query="$q" --tiebreak=index \
      --print-query --expect=ctrl-d --toggle-sort=\`); do
    q=$(head -1 <<< "$out")
    k=$(head -2 <<< "$out" | tail -1)
    shas=$(sed '1,2d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
    [ -z "$shas" ] && continue
    if [ "$k" = 'ctrl-d' ]; then
      git diff --color=always $shas | less -R
    else
      for sha in $shas; do
        git show --color=always $sha | less -R
      done
    fi
  done
}

# git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" | xargs printf 'yoyoyoyoyoyo\n%s'
# --header-file="/Users/supercrabtree/.fstashheader"\
fstash() {
  local out q k sha
  while out=$(
    echo "enter: show stash contents | ctrl-d: diff stash against HEAD | ctrl-a: apply stash | ctrl-b: checkout new branch containing stash\n\
      $(git stash list --pretty="$git_log_defaults")" |
    fzf --ansi --no-sort --query="$q" --print-query \
      --header-lines=1\
      --expect=ctrl-d,ctrl-b,ctrl-p,ctrl-a);
  do
    q=$(head -1 <<< "$out")
    k=$(head -2 <<< "$out" | tail -1)
    sha=$(tail -1 <<< "$out" | cut -d' ' -f1)
    [ -z "$sha" ] && continue
    if [ "$k" = 'ctrl-d' ]; then
      git diff $sha
    elif [ "$k" = 'ctrl-b' ]; then
      git stash branch "stash-$sha" $sha
      break;
    elif [ "$k" = 'ctrl-p' ]; then
      git stash pop $sha
      break;
    elif [ "$k" = 'ctrl-a' ]; then
      git stash apply $sha
      break;
    else
      git stash show -p $sha
    fi
  done
}

c() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{{::}}'

  # Copy History DB to circumvent the lock
  # - See http://stackoverflow.com/questions/8936878 for the file path
  cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
  from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

fancy-branch() {
  local tags localbranches remotebranches target
  tags=$(
  git tag | awk '{print "\x1b[33;1mtag\x1b[m\t" $1}') || return
  localbranches=$(
  git branch       | grep -v HEAD             |
  sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
  sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  remotebranches=$(
  git branch --remote | grep -v HEAD             |
  sed "s/.* //"       | sed "s#remotes/[^/]*/##" |
  sort -u             | awk '{print "\x1b[31;1mbranch\x1b[m\t" $1}') || return
  target=$(
  (echo "$localbranches"; echo "$remotebranches"; echo "$tags";) |
  fzf --no-hscroll --ansi +m -d "\t" -n 2) || return
  if [[ -z "$BUFFER" ]]; then
    git checkout $(echo "$target" | awk '{print $2}')
    zle accept-line
  else
    res=$(echo "$target" | awk '{print $2}')
    LBUFFER="$(echo "$LBUFFER" | xargs) ${res}"
    zle redisplay
  fi
}

fkill() {
  pid=$(ps -ef | sed 1d | fzf -m -e | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

fport() {
  pid=$(lsof -P | fzf -e | awk '{print $2}')
  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

fvim() {
  vim $(fzf -m)
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


[ -f ~/.zshrc-post ] && source ~/.zshrc-post

compinit
: <<'COMMENTS'
p () {
  if [ -z "$PROTOTYPE_FOLDER" ]; then
    echo '\n\033[0;32mYou must set environment varible for where your prototypes will go, put \033[0mexport PROTOTYPE_FOLDER=~/path/where/i/want/prototypes\033[0;32m in your .zshrc. Make sure the folder exists!\033[0m'
  else
    if [ $1 ]; then
      NAME=$1
    else
      NAME=proto-$[($RANDOM % 13843) + 1]
    fi
    cd $PROTOTYPE_FOLDER
    mkdir $NAME
    git clone git@github.com:supercrabtree/prototype $NAME
    cd $NAME
    npm install && bower install && echo '\n  \033[0;32mPrototype ready!\n\n  run using\033[0m npm start\n  \033[0;32mchange the remote using \033[0mgit remote set-url origin git@github.com:user/other-repo.git'
  fi
}


git() {
  if [[ $# == 0 ]]; then
    command git
    return $?
  fi

  __beginswith() { case $2 in "$1"*) true;; *) false;; esac; }

  __used_git_command=""
  for arg in "$@"; do
    if ! __beginswith "--" $arg; then
      __used_git_command=$arg
      break
    fi
  done

  __all_git_commands=$(command git help -a | grep "^  [a-z]" | tr ' ' '\n' | grep -v "^$")
  while read i; do
    if [ "$__used_git_command" = "$i" ]; then
      command git "$@"
      return $?
    fi
  done < <(printf '%s' "$__all_git_commands")

  __res=$(command git "$@" 2>&1)
  __intented=$(printf '%s' "$__res" | xargs | sed -n 's/git: .* is not a git command\. See git --help\. Did you mean this\? \(.*\)/\1/p')
  if [ -n "$__intented" ]; then
    shift
    set -- "$__intented" "$@"
    printf '%s\n\n' "$__res"
    printf 'git '
    printf '%s ' "$@"
    read -k1 -s
    printf '\n\n'
    set -x
    command git "$@"
  fi
}

COMMENTS
