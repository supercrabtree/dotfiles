
# Plugins {{{
source ~/dev/pure/async.zsh
source ~/dev/pure/pure.zsh
source ~/dev/z/z.sh
source ~/dev/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dev/bam-pow/bam.sh
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

# Exports {{{
export EDITOR=vim
export VISUAL=$EDITOR
export BACKGROUND=light

# mac style
export LSCOLORS=exfxcxdxbxegedabagacad
# linux style
export LS_COLORS='di=0;34:ln=0;35:so=0;32:pi=0;33:ex=0;31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

export LESS="-RFX"
export ZDOTDIR=$HOME

export BAM_DIR="$HOME/dev/scratches"
export POW_DIR="$HOME/dev"

export LESS_TERMCAP_mb=$'\E[3;31m'
export LESS_TERMCAP_md=$'\E[1;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;05;00;48;05;03m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;34m'

export PATH=$PATH:$HOME/.npm/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/bin
export PATH=$PATH:/sbin
export PATH=$PATH:$HOME/bin

export PATH=$PATH:$HOME/dev/lm
export PATH=$PATH:$HOME/dev/git-functions

export PATH=$PATH:/usr/local/lib/ruby/gems/2.2.0/bin/
export PATH=$PATH:/Users/george.crabtree/.gem/ruby/2.2.0/bin
export PATH=$PATH:/usr/local/Cellar/ruby22/2.2.5_2/lib/ruby/gems/2.2.0/bin
export PATH=$PATH:`yarn global bin`
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

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# }}}

# Z Style {{{
zstyle ':completion:*'         list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:*:*:*' menu select
# }}}

# New Keyboard Shortcuts {{{
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

zle -N fancy-branch
bindkey '^b' fancy-branch

zle -N up-line-or-beginning-search
zle -N searchup
bindkey "^[[A" searchup

zle -N down-line-or-beginning-search
zle -N searchdown
bindkey "^[[B" searchdown

zle -N aliasexpander
bindkey " " aliasexpander
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches
# }}}

# Aliases {{{
unalias run-help
alias man="run-help"
alias l="gls --color -AU"
alias ll="lm"
alias t="tree -Ca -I 'node_modules|.git|.DS_Store|bower_components'"

alias download-video-as-audio="youtube-dl -x --audio-format=mp3"

alias vanillavim="command vim -u NONE"
alias vi="$EDITOR"
alias vimrc="$EDITOR $HOME/dev/dotfiles/.vimrc"
alias zshrc="$EDITOR $HOME/dev/dotfiles/.zshrc"
alias jsonp='pbpaste | joli -o inspect'
alias json='joli -o inspect'
alias vless='vim -u /usr/local/Cellar/vim/8.0.0596/share/vim/vim80/macros/less.vim'

alias git=hub
alias g=magic-g
alias gg="git remote -v"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit"
alias gl="git log --no-merges -z --pretty=stacked -20"
alias glm="git log -z --pretty=stacked -20"
alias glv="git log --no-merges -z --pretty=stacked"
alias glmv="git log -z --pretty=stacked"
alias d="standard-diff"
alias D="git diff --staged"
alias ds="git diff --stat"
alias DS="git diff --staged --stat"
alias cvim="git mergetool --no-prompt"
alias gvim=git-files-vim

alias rm=trash

alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# suffix
alias -s git='git clone'

# global
alias -g UP='@{u}'
alias -g IN='..@{u}'
alias -g OUT='@{u}..'

aliasestoexpand=(
  "l"
  "download-video-as-audio"
  "vanillavim"
  "t"
  "ga"
  "gg"
  "gc"
  "gl"
  "glm"
  "glv"
  "glmv"
  "D"
  "ds"
  "DS"
  "cvim"
  "rm"
)
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
  if [[ $LBUFFER =~ " [A-Z0-9]+$" ]]; then
    zle _expand_alias
    zle expand-word
  fi
  zle self-insert
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
# }}}

# Standard Functions {{{
cdwhich() {
  cd "$(dirname $(which $1))"
}

mkcd() {
  mkdir -p $1 && cd $1
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

# ..() Switch to parent directory by matching on partial name
# Usage:
# cd /usr/share/doc/zsh
# .. ha      # cd's to /usr/share
function .. () {
    (( $# == 0 )) && { cd .. && return }

    local match_idx
    local -a parents matching_parents new_path
    parents=( ${(s:/:)PWD} )
    matching_parents=( ${(M)${parents[1,-2]}:#*"${1}"*} )

    if (( ${#matching_parents} )); then
        match_idx=${parents[(i)${matching_parents[-1]}]}
        new_path=( ${parents[1,${match_idx}]} )

        cd "/${(j:/:)new_path}"
        return $?
    fi

    return 1
}

jobcount() {
  local jobs=$(jobs | grep ^\\\[ | wc -l | xargs)
  ((jobs)) && echo -n "${jobs} "
}
# }}}

# Git things {{{
magic-g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status -sb
  fi
}

# open any files that have been edited, or are new and untracked.
# if working directory is clean, open files edited in last commit (with a prompt).
git-files-vim() {
  local files=$(git ls-files -m && git ls-files -o --exclude-standard && git diff --cached --name-only)
  if [[ $files != "" ]]; then
    vim $(git ls-files -m && git ls-files -o --exclude-standard && git diff --cached --name-only)
  else
    if [ $1 ]; then
      local REF=$1
    else
      local REF="@^"
    fi
      echo '\nCommits' && git log "$REF.." -z --pretty=stacked && echo '\nFiles' && git diff --stat "$REF.."
      echo '\nPress any key open these files'; read -k1 -s
      vim $(git diff --name-only "$REF..")
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

# completion for git functions
# `alias __git-diff_main=_git_diff` is a hacky edit to get around ... something weird to do with git, hub, zsh, brew?
# https://github.com/robbyrussell/oh-my-zsh/issues/2394#issuecomment-45287624
alias __git-diff_main=_git_diff
compdef _git standard-diff=git-diff
compdef g git
# }}}

# FZF things {{{
export FZF_DEFAULT_OPTS="--extended --reverse --multi --cycle\
  --bind=ctrl-n:toggle-down\
  --color=fg:8,fg+:-1,bg:-1,bg+:-1,hl:0,hl+:3,prompt:2,marker:2,pointer:2,info:9"

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

fzf-history-widget() {
  local selected num fade
  if [[ $BACKGROUND == "dark" ]]; then fade=0 fi
  if [[ $BACKGROUND == "light" ]]; then fade=15 fi
  # --color=spinner:"$fade",info:"$fade"
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

unalias z 2> /dev/null
z() {
  if [[ -z "$*" ]]; then
    cd "$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
  else
    _z "$@"
  fi
}

zle      -N  fzf-history-widget
bindkey '^R' fzf-history-widget
# }}}



# vim:fdm=marker
