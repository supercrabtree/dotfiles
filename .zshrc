# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="pure"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(zsh-syntax-highlighting z)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:/usr/local/sbin:/Users/GCrabtree/.rvm/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:$PATH

export EDITOR=/usr/bin/nano

alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"
alias dev="cd ~/Dropbox/dev"
alias gulp='nocorrect gulp'
alias mongod='nocorrect mongod'
alias reload='source ~/.zshrc'
alias ajfgit='git config user.name "George Crabtree" && git config user.email gcrabtree@ajfpartnership.com.au'

l() {
  LSRESULTS="$(script -q /dev/null ls -laG | sed 's/^\(d\)/\\033[36m\1\\033[0m/g' | sed 's/^\(l\)/\\033[35m\1\\033[0m/g'"
  # 's/^(.{1})(rwx)/\1\2/g' should work but cant get it to
  echo "$LSRESULTS"
}

gs() {
  MESSAGE=""
  for i in "$@"; do
    MESSAGE+=$i" "
  done

  # if [$MESSAGE==""]
  #   then
  #   echo "\n\033[0;31mYou must enter a commit message.\033[0m"
  #   exit 1
  # fi

  echo "\n\033[0;31mgit add -A\033[0m"
  git add -A
  echo "\n\033[0;31mgit commit -m $MESSAGE\033[0m"
  git commit -m $MESSAGE
  echo "\n\033[0;31mgit pull origin master\033[0m"
  git pull origin master
  echo "\n\033[0;31mgit push origin master\033[0m"
  git push origin master
}

mkcd () {
  mkdir -p -v $1 && cd $1
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
    cd ~/Dropbox/dev/yeah && mkdir $NAME && cd $_
    yo $1
    subl .
  else
    cd ~/Dropbox/dev/yeah && mkdir yeah-$[($RANDOM % 13843) + 1] && cd $_
  fi
}

clean() {
  find . -type f -iregex ".* Report.txt" | while read FILENAME
  do
    echo "Deleting:"
    echo "${FILENAME}"
    rm "${FILENAME}"
  done
}

colortest () {
  for x in 0 1 4 5 7 8; do for i in `seq 30 37`; do for a in `seq 40 47`; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo "";
}

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
