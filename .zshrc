source ~/dev/dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle command-not-found
antigen bundle z
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme supercrabtree/pure pure

antigen apply


source ~/.zshloadvim
source ~/dev/k/k.sh

export SHELL=/bin/zsh

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:$HOME/npm/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/bin/usr/local/share/npm/bin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/local/git/bin
export PATH=$PATH:/usr/local/heroku/bin
export PATH=$PATH:$HOME/npm/bin

export GIT_MERGE_AUTOEDIT=no
export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=vim

alias zshrc="vim ~/.zshrc"
alias vimrc='vim ~/.vimrc'
alias dev="cd ~/dev"
alias gulp='nocorrect gulp'
# alias mongod='nocorrect mongod'
alias reload='source ~/.zshrc'
alias o="vim ."
alias oo="open ."

alias glg='git log --graph --decorate --all --pretty="%C(yellow)%h%C(auto)%d %C(blue)%s %Cgreen%cr %Creset%cn"'
alias glv='git log --decorate --all --pretty="%C(yellow)%h %>(14)%Cgreen%cr%C(auto)%d %C(blue)%s %Creset%cn"'
alias grc='git add -A && git rebase --continue'

zmodload zsh/mathfunc

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
  git --no-pager log --decorate --all --pretty="%C(yellow)%h %>(14)%Cgreen%cr%C(auto)%d %C(blue)%s %Creset%cn" "-$LINES"
}
killport() {
  PORT=$1
  lsof -P | grep ':$PORT' | awk '{print $2}' | xargs kill -9
}
pr() {
  if [ $1 ]; then
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
    hub pull-request -m $1 -b $TO_BRANCH -h $FROM_BRANCH;
  else
    echo "\n\033[0;31mYou must enter a pull request message.\033[0m\n"
    return 1;
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

# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status -s --ignored
  fi
}
# Complete g like git
# compdef g=git

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

gc() {
  if [ $1 ]; then
    echo "\n\033[0;34mgit add -A\033[0m"
    git add -A || { return 1; }

    echo "\n\033[0;34mgit commit -m \033[0m\033[0;33m$1\033[0m"
    git commit -m $1 || { return 1; }
  else
     echo "\033[0;31mYou must enter a commit message.\033[0m"
     return 1;
  fi
}

# Serve some static stuff from CWD fast
serve() {
  PORT=8001
  if [ "$1" != "" ]; then
    PORT=$1
  fi
  open "http://localhost:$PORT"
  python -m SimpleHTTPServer $PORT
}

mkcd () {
  mkdir -p -v $1 && cd $1
}

cdwhich() {
  cd "$(dirname $(which $1))"
}

zz() {
  z $1
  vim .
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
    vim .
  else
    cd ~/dev/yeah && mkdir yeah-$[($RANDOM % 13843) + 1] && cd $_
  fi
}

colortest() {
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
  echo
  -e "\n"
}

t () {
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

rt () {
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



export PIX_ROOT="$HOME/dev"
export PIX_FRONTEND="$PIX_ROOT/pix-frontend"
export PIX_BACKEND="$PIX_ROOT/pix-backend"
export PIX_WIKI="$PIX_ROOT/pix-backend.wiki"
export PIX_SUB="$PIX_ROOT/pix-sub"
#Use the line below fitting your ruby version manager
#For RVM
#RVM is no longer supported. Please use Rbenv instead.
#For Rbenv
export RUBY_SERVER_SCRIPT_COMMAND="bundle exec rails server"

#The init script
eval "$($PIX_SUB/bin/pix init -)"

#Rbenv
eval "$(rbenv init -)"
