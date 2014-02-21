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

# git sync
gs() {

  MESSAGE=""
  for i in "$@"; do
    MESSAGE+=$i" "
  done

  set -x
  set -e

  git add -A
  git commit -m $MESSAGE
  git pull origin master
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






# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
