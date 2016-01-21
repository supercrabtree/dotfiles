# [ -f ~/.zshrc-pre ] && source ~/.zshrc-pre

# Plugins
# ------------------------------------------------------------------------------
source ~/.zplug/zplug

zplug "rupa/z", of:z.sh
zplug "djui/alias-tips"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "knu/zsh-manydots-magic", of:manydots-magic, nice:10
zplug "k4rthik/git-cal", as:command
zplug "robbyrussell/oh-my-zsh", of:lib/history.zsh
zplug "robbyrussell/oh-my-zsh", of:plugins/sudo/sudo.plugin.zsh

zplug "~/dev/pure", from:local
zplug "~/dev/k", from:local, of:k.sh

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


# Autoload
# ------------------------------------------------------------------------------
autoload -U run-help
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search


# Zsh options
# ------------------------------------------------------------------------------
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt dotglob


# Exports
# ------------------------------------------------------------------------------
export SHELL=/bin/zsh
export GOPATH=$HOME/dev/go
export GIT_MERGE_AUTOEDIT=no
export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=vim
export MYZSHRC=~/.zshrc
export MYVIMRC=~/.vimrc
export PROTOTYPE_FOLDER=~/dev/yeah
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="(╯°□°）╯︵ ┻━┻ "
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=0;34:ln=0;35:so=0;32:pi=0;33:ex=0;31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export BACKGROUND=dark

export PATH=$PATH:$HOME/.rvm/bin
export PATH=$PATH:$HOME/.npm/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$GOPATH/bin


# Misc
# ------------------------------------------------------------------------------
# stop control flow, gimme ctrl-s back
bindkey -r '\C-s'
stty -ixon
setopt noflowcontrol

# 10 times the history size
HISTSIZE=100000
SAVEHIST=100000

# using the homebrew version of zsh, so point at their docs
HELPDIR=/usr/local/share/zsh/help

source <(npm completion)


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
bindkey "^[[A" up-line-or-beginning-search

zle -N down-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

zle -N first-tab
bindkey '^I' first-tab

zle -N switch-background
bindkey -r '^_'
bindkey '^_' switch-background

zle -N globalaliasexpander
bindkey " " globalaliasexpander
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches


# Aliases
# ------------------------------------------------------------------------------
alias k="k -a"
alias l="k -a --no-vcs"
alias mkcd="_(){ mkdir -pv $1 && cd $1; }; _"
alias dev="cd ~/dev"
alias f="open ."
alias reload="exec zsh"
alias nw="/Applications/node-webkit.app/Contents/MacOS/node-webkit ."

alias zshrc="vim ~/.zshrc"
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vimrc="vim ~/.vimrc"
alias clearvim="rm -rf ~/.vim/tmp/*"

alias run="./run"
alias build="./build"
alias deploy="./deploy"
alias setup="./setup"

alias glg='git log --graph --decorate --all --pretty="%C(yellow)%h%C(auto)%d %C(blue)%s %Cgreen%cr %Creset%cn"'
alias glv='git log --decorate --all --pretty="%C(yellow)%h %>(14)%Cgreen%cr%C(auto)%d %C(blue)%s %Creset%cn"'
alias grc='git add -A && git rebase --continue'
alias gc='git commit'
alias gaa='git add -A'

# suffix
alias -s git='git clone'

# global
alias -g G='| grep -i '
alias -g F='| fzf --ansi'


# Custom Functions
# ------------------------------------------------------------------------------
cdwhich() {
  cd "$(dirname $(which $1))"
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

# colored man pages
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;32m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[38;05;00;48;05;03m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;34m") \
    PAGER="${commands[less]:-$PAGER}" \
    _NROFF_U=1 \
    PATH="$HOME/bin:$PATH" \
    man "$@"
}

switch-background () {
  if [[ $BACKGROUND == "dark" ]]; then
    BACKGROUND=light
    echo -e "\033]50;SetProfile=supercrabtree-light\a             ┬─┬ ︵ ノ(°_° ノ)"
    zle reset-prompt
  else
    BACKGROUND=dark
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

gvim() {
  vim `git ls-files -m`
}

cvim() {
  vim `git diff --name-only --diff-filter=u`
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
  git --no-pager log --decorate --all --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%s %Creset%cn%C(auto)%d" "-$LINES"
}

glb() {
  LINES=20
  if [ $1 ]; then
    LINES=$1
  fi
  git --no-pager log --decorate --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%s %Creset%cn%C(auto)%d" "-$LINES"
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

play() {
  if [ $1 ]
  then
    if [ $2 ]
    then
      NAME=$1-$2
    else
      NAME=$1-$[($RANDOM % 13843) + 1]
    fi
    cd ~/dev/yeah && mkdir $NAME && cd $_
    yo $1
    vim
  else
    cd ~/dev/yeah && mkdir yeah-$[($RANDOM % 13843) + 1] && cd $_
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
    git diff --color
    git ls-files --others --exclude-standard | while read -r i; do git diff --color -- /dev/null "$i"; done
    ) | less -R
  else
    git diff "$@"
  fi
}


# FZF functions
# ------------------------------------------------------------------------------
export FZF_DEFAULT_OPTS="--extended --multi --reverse --cycle\
  --bind=ctrl-n:toggle-down\
  --color=fg:8,fg+:-1,bg:-1,bg+:-1,hl:4,hl+:2,prompt:2,marker:2,pointer:2,info:5"

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
      $(git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs")" |
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
bindkey '^F' fzf-file-widget
zle      -N  fzf-file-widget
bindkey '^I' $fzf_default_completion


[ -f ~/.zshrc-post ] && source ~/.zshrc-post


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

COMMENTS
