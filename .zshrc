# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="pure"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(z zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source ~/dev/k/k.sh

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/Users/georgecrabtree/npm/bin:$PATH
export PATH=/Users/georgecrabtree/bin:$PATH
export PATH=/bin/usr/local/share/npm/bin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/bin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/sbin:$PATH
export PATH=/usr/local/git/bin:$PATH
export PATH=/usr/local/heroku/bin:$PATH

export EDITOR=/usr/bin/nano

export GIT_MERGE_AUTOEDIT=no

alias zshconf="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"
alias dev="cd ~/dev"
alias gulp='nocorrect gulp'
# alias mongod='nocorrect mongod'
alias reload='source ~/.zshrc'
alias o="subl ."
alias oo="open ."
# git log verbose
alias glg='git log --graph --decorate --all --pretty="%C(yellow)%h%C(auto)%d %C(blue)%s %Cgreen%cr %Creset%cn"'
alias glv='git log --decorate --all --pretty="%C(yellow)%h %>(14)%Cgreen%cr%C(auto)%d %C(blue)%s %Creset%cn"'
alias gl='git --no-pager log --decorate --all --pretty="%C(yellow)%h %>(14)%Cgreen%cr%C(auto)%d %C(blue)%s %Creset%cn" -40'

zmodload zsh/mathfunc

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
  subl .
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
    subl .
  else
    cd ~/dev/yeah && mkdir yeah-$[($RANDOM % 13843) + 1] && cd $_
  fi
}

clean() {
  find . -type f -iregex ".* Report.txt" | while read FILENAME
  do
    echo "Deleting: ${FILENAME}"
    rm "${FILENAME}"
  done
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

export SHELL=/bin/zsh

export PIX_ROOT="/Users/georgecrabtree/dev"
export PIX_FRONTEND="$PIX_ROOT/platform.WEB"
export PIX_BACKEND="$PIX_ROOT/platform.SERVICES"
export PIX_WIKI="$PIX_ROOT/platform.SERVICES.wiki"
export PIX_SUB="$PIX_ROOT/platform.PIXSUB"
#Use the line below fitting your ruby version manager
#For RVM
#RVM is no longer supported. Please use Rbenv instead.
#For Rbenv
export RUBY_SERVER_SCRIPT_COMMAND="bundle exec rails server"

#The init script
eval "$($PIX_SUB/bin/pix init -)"

#Rbenv
eval "$(rbenv init -)"