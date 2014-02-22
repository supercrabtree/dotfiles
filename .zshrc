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
  #     #retain linebrakes              #find anyone writable stuff and background color red   #look for r-x after 7 chars and make it green       #look for r-x after 4 chars and make it yellow      #look for rwx after 1 chars and make it red         #if first char is d make it red        #if first char is d make it magenta         
  echo "$(script -q /dev/null ls -laG | sed 's/^\(.\{7\}\)\(.w.\)/\\033[30;41m\1\2\\033[0m/' | sed 's/^\(.\{7\}\)\(r-x\)/\1\\033[32m\2\\033[0m/' | sed 's/^\(.\{4\}\)\(r-x\)/\1\\033[33m\2\\033[0m/' | sed 's/^\(.\{1\}\)\(rwx\)/\1\\033[31m\2\\033[0m/' | sed 's/^\(d\)/\\033[36m\1\\033[0m/g' | sed 's/^\(l\)/\\033[35m\1\\033[0m/g')"
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
  # git add -A
  echo "\n\033[0;31mgit commit -m \033[0;33m$MESSAGE\033[0m"
  # git commit -m $MESSAGE
  echo "\n\033[0;31mgit pull origin master\033[0m"
  # git pull origin master
  echo "\n\033[0;31mgit push origin master\033[0m"
  # git push origin master
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
  for x in 0 1 4 5 7 8; do for i in 30 31 32 33 34 35 36 37; do for a in 40 41 42 43 44 45 46 47; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo "";
}

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
