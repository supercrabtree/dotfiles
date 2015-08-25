source ~/dev/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle rupa/z
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle mollifier/cd-gitroot
antigen bundle tarruda/zsh-autosuggestions
antigen theme /Users/supercrabtree/dev/pure pure
antigen apply

source ~/dev/k/k.sh

zmodload zsh/mathfunc
autoload zmv

export SHELL=/bin/zsh
export GOPATH=$HOME/dev/go

export PATH=$PATH:$HOME/.rvm/bin
export PATH=$PATH:$HOME/.npm/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.random/bin

export GIT_MERGE_AUTOEDIT=no
export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=vim
export BACKGROUND=dark
export MYZSHRC=~/.zshrc
export MYVIMRC=~/.vimrc
export SSHIDENT=pix
export PROTOTYPE_FOLDER=~/dev/yeah

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias zshrc="vim ~/.zshrc"
alias vimrc='vim ~/.vimrc'
alias dev="cd ~/dev"
alias reload='source ~/.zshrc'
alias o="open ."
alias deploy="./deploy.sh"
alias clearvim='rm -rf ~/.vim/tmp/*'

alias glg='git log --graph --decorate --all --pretty="%C(yellow)%h%C(auto)%d %C(blue)%s %Cgreen%cr %Creset%cn"'
alias glv='git log --decorate --all --pretty="%C(yellow)%h %>(14)%Cgreen%cr%C(auto)%d %C(blue)%s %Creset%cn"'
alias grc='git add -A && git rebase --continue'
alias gc='git commit'
alias gaa='git add -A'
alias nw='/Applications/node-webkit.app/Contents/MacOS/node-webkit .'
alias k="k -a"
alias l="k -a --no-vcs"
alias t="(tmux has &>/dev/null) && tmux attach -t scratch || tmux new -s scratch"
alias st="ssh-toggle"

bindkey -r '\C-s'
stty -ixon

FLIP_FLOP=0
s () {
  if [ $FLIP_FLOP -eq 0 ]; then
    FLIP_FLOP=1
    echo -e "\033]50;SetProfile=supercrabtree-light\a"
  else
    FLIP_FLOP=0
    echo -e "\033]50;SetProfile=supercrabtree-dark\a"
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
  if [ $1 ]; then
    MESSAGE=$1
  else
    MESSAGE=$(git rev-parse --abbrev-ref HEAD)
  fi
  echo $MESSAGE
  if [ $2 ]; then
    TO_BRANCH=$2
  else
    TO_BRANCH=dev;
  fi
  if [ $3 ]; then
    FROM_BRANCH=$3;
  else
    FROM_BRANCH=$(git rev-parse --abbrev-ref HEAD);
  fi
  hub pull-request -m $MESSAGE -b $TO_BRANCH -h $FROM_BRANCH | pbcopy
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

# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status -s
  fi
}
# Complete g like git
compdef g=git

gs() {
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD);

  if [ $1 ]; then
    echo "\n\033[0;34mgit add -A\033[0m"
    git add -A || { return 1; }

    echo "\n\033[0;34mgit commit -m \033[0m\033[0;33m$1\033[0m"
    git commit -m $1 || { return 1; }
  fi

  echo "\n\033[0;34mgit pull --rebase origin $CURRENT_BRANCH\033[0m"
  git pull --rebase origin $CURRENT_BRANCH || { return 1; }

  echo "\n\033[0;34mgit push origin $CURRENT_BRANCH\033[0m"
  git push origin $CURRENT_BRANCH || { return 1; }
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

mkcd () {
  mkdir -p -v $1 && cd $1
}

cdwhich() {
  cd "$(dirname $(which $1))"
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

de() {
  searchFor=""
  sayIt='false'
  for i in $@; do
    if [ $i = "-s" ]; then
      sayIt='true'
    else
      searchFor+="$i "
    fi
  done
  __CF_USER_TEXT_ENCODING=0x1F5:0x8000100:0x8000100
  res=`curl -s -i --user-agent "" -d "sl=en" -d "tl=de" --data-urlencode "text=$searchFor" https://translate.google.com | ack '(?:<span id=result_box[^>]*>[^>]*>)(.*?)(?:</span>)' --output '$1' | iconv -f LATIN1 -t UTF8`
  echo $res | tr -d  '\n' | pbcopy
  echo "\n  \033[0;33m$res\033[0m"
  if [ $sayIt = 'true' ]; then
    `say -v Anna $res -r 220`
  fi
}

en() {
  searchFor=""
  sayIt='false'
  for i in $@; do
    if [ $i = "-s" ]; then
      sayIt='true'
    else
      searchFor+="$i "
    fi
  done
  __CF_USER_TEXT_ENCODING=0x1F5:0x8000100:0x8000100
  res=`curl -s -i --user-agent "" -d "sl=de" -d "tl=en" --data-urlencode "text=$searchFor" https://translate.google.com | ack '(?:<span id=result_box[^>]*>[^>]*>)(.*?)(?:</span>)' --output '$1' | iconv -f LATIN1 -t UTF8`
  echo $res | tr -d  '\n' | pbcopy
  echo "\n  \033[0;33m$res\033[0m"
  if [ $sayIt = 'true' ]; then
    `say $res -r 220`
  fi
}

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

ssh-pix () {
  echo 'Host github.com\n  HostName github.com\n  User git\n  IdentityFile ~/.ssh/id_pix_rsa\n' > ~/.ssh/config
}
ssh-me () {
  echo 'Host github.com\n  HostName github.com\n  User git\n  IdentityFile ~/.ssh/id_rsa\n' > ~/.ssh/config
}

ssh-toggle() {
if [ $SSHIDENT = "pix" ]
then
  export SSHIDENT=me
  echo 'Host github.com\n  HostName github.com\n  User git\n  IdentityFile ~/.ssh/id_rsa\n' > ~/.ssh/config
  echo "\n\033[38;5;242;mUsing ssh key\033[0m ~/.ssh/id_rsa"
else
  export SSHIDENT=pix
  echo 'Host github.com\n  HostName github.com\n  User git\n  IdentityFile ~/.ssh/id_pix_rsa\n' > ~/.ssh/config
  echo "\n\033[38;5;242;mUsing ssh key\033[0m ~/.ssh/id_pix_rsa"
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

## fzf stuff
export FZF_DEFAULT_OPTS="--extended --multi --reverse --cycle\
  --bind=ctrl-n:toggle-down\
  --color=fg:8,fg+:-1,bg:-1,bg+:-1,hl:4,hl+:2,prompt:2,marker:2,pointer:2,info:5"


fbr() {
  local branches branch
  branches=$(git branch) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | sed "s/.* //")
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

fco() {
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
  git checkout $(echo "$target" | awk '{print $2}')
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

eval "$(gulp --completion=zsh)"

# New Keyboard Shortcuts
# ------------------------------------------------------------------------------
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

zle -N fancy-ctrl-q
bindkey '^Q' fancy-ctrl-q


# Pixformance stuff
# ------------------------------------------------------------------------------
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
export PIX_ROOT="$HOME/dev/pix"
export PIX_FRONTEND="$PIX_ROOT/web.platform"
export PIX_BACKEND="$PIX_ROOT/api.services"
export PIX_WIKI="$PIX_ROOT/api.services.wiki"
export PIX_SUB="$PIX_ROOT/platform.PIXSUB/"
export RUBY_SERVER_SCRIPT_COMMAND="bundle exec rails server"
eval "$($PIX_SUB/bin/pix init -)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
