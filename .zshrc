#==============================================================================
# CORE CONFIGURATION
#==============================================================================

# ZSH Options {{{
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

# History Settings {{{
HISTFILE=$HOME/.zsh_history
HISTSIZE=200000
SAVEHIST=200000
# }}}

# Core Function Loading {{{
autoload -U run-help
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
autoload -U compinit; compinit
zmodload zsh/mapfile

# Stop control flow to get ctrl-s back
stty -ixon
# }}}

#==============================================================================
# ENVIRONMENT VARIABLES
#==============================================================================

# Editor Settings {{{
export EDITOR=nvim
export VISUAL=$EDITOR
export GPG_TTY=$(tty)
# }}}

# Terminal Style {{{
export BACKGROUND=light

# Mac style colors
export LSCOLORS=exfxcxdxbxegedabagacad
# Linux style colors
export LS_COLORS='di=0;34:ln=0;35:so=0;32:pi=0;33:ex=0;31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

# Less pager settings
export LESS='-RFX'
export LESS_TERMCAP_mb=$'\E[3;31m'
export LESS_TERMCAP_md=$'\E[1;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;05;00;48;05;03m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;34m'
# }}}

#==============================================================================
# PATH CONFIGURATION
#==============================================================================

# Path Settings {{{
# Initialize Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH=$PATH:$HOME/bin
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:/opt/homebrew/sbin
export PATH=$PATH:$HOME/dev/git-open/
export PATH=$PATH:$HOME/dev/git-more
export PATH="/opt/homebrew/opt/pnpm@9/bin:$PATH"

# PNPM configuration
export PNPM_HOME="/Users/george/Library/pnpm"
[[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PNPM_HOME:$PATH"

# Add ZSH function path
fpath+=($HOME/dev/pure)
fpath+=("$(brew --prefix)/share/zsh/site-functions")
HELPDIR=/usr/local/share/zsh/help
# }}}

# Prompt Initialization {{{
autoload -U promptinit; promptinit
promptinit
# }}}

#==============================================================================
# PLUGINS & EXTERNAL TOOLS
#==============================================================================

# Plugin Loading {{{
source "$HOME/dev/k/k.sh"
source "$HOME/dev/enhancd/init.sh"
source "$HOME/dev/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/dev/bam-pow/bam.sh"
source "$HOME/dev/bam-pow/pow.sh"

# bam-pow configuration
export BAM_DIR="$HOME/Documents/Scratches"
export POW_DIR="$HOME/dev/powder"

# ZSH syntax highlighting config
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=blue'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=blue'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=blue'

# iTerm2 integration
test -e "$HOME/.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh"

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Nix profile
if [ -e /Users/george/.nix-profile/etc/profile.d/nix.sh ]; then 
  . /Users/george/.nix-profile/etc/profile.d/nix.sh
fi

# Z directory jumper
if [[ -f "$(brew --prefix)/etc/profile.d/z.sh" ]]; then
  _Z_DATA="$HOME/.z/.z"
  source "$(brew --prefix)/etc/profile.d/z.sh"
fi

# Load local environment
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
# }}}

#==============================================================================
# PROMPT CONFIGURATION
#==============================================================================

# Prompt Settings {{{
prompt pure 2>/dev/null || echo "Run 'brew install pure' to install the pure prompt"
export PURE_GIT_PULL=0

# Prompt styling
zstyle :prompt:pure:prompt:success color green
zstyle :prompt:pure:git:fetch only_upstream yes
zstyle :prompt:pure:git:branch:cached color 242
zstyle :prompt:pure:git:dirty color red

# Completion styling
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select
# }}}

#==============================================================================
# KEY BINDINGS
#==============================================================================

# Keyboard Shortcuts {{{
# Fancy ctrl-z toggle between fg/bg
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# History search with up/down
zle -N up-line-or-beginning-search
zle -N searchup
bindkey "^p" searchup

zle -N down-line-or-beginning-search
zle -N searchdown
bindkey "^n" searchdown

# Alias expansion on space
zle -N aliasexpander
bindkey " " aliasexpander

#==============================================================================
# FZF CONFIGURATION
#==============================================================================

# FZF Settings {{{
export FZF_DEFAULT_OPTS="--extended --reverse --multi --cycle --bind=ctrl-d:half-page-down,ctrl-u:half-page-up"
# }}}
source <(fzf --zsh)
source ~/dev/fzf-git.sh/fzf-git.sh

#==============================================================================
# ALIASES
#==============================================================================

# Navigation Aliases {{{
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
# }}}

# File Operation Aliases {{{
alias t='tree -a -I "node_modules|.git|.DS_Store|dist|build"'
alias rm='trash'
# }}}

# Editor & Configuration Aliases {{{
alias vanillavim='command vim -u NONE'
alias vi="$EDITOR"
alias vimrc="$EDITOR $HOME/dev/dotfiles/.vimrc"
alias nvimrc="$EDITOR $HOME/.config/nvim/"
alias zshrc="$EDITOR $HOME/dev/dotfiles/.zshrc"
# }}}

# Git Aliases {{{
alias g=magic-g
alias gg='git remote -v | column -t'
alias gdm='g-diff-mega'
alias gb='git branch -vv'
alias gc="git commit -m '.'"
alias gca="git commit -am '.'"
alias gcA="git add -A && git commit -m '.'"
alias gl='echo && git log -z --pretty=stacked -10'
alias d='standard-diff'
alias D='git diff --staged'

# Git editor aliases
alias gvim='git-files-vim'
alias cvim='git mergetool'
alias svim='vim `git diff --name-only --diff-filter=d --staged`'

# Global git aliases
alias -g UP='@{u}'
alias -g IN='..@{u}'
alias -g OUT='@{u}..'
# }}}

# Utility Aliases {{{
alias p='~/dev/pomo.sh'
alias man='run-help'
alias json='joli -o inspect'
alias jsonp='pbpaste | joli -o inspect'
# }}}

# Private configuration {{{
# Source private settings (work-related, secrets, etc.)
[[ -f "$HOME/dev/dotfiles/.private.zsh" ]] && source "$HOME/dev/dotfiles/.private.zsh"
[[ -f "$HOME/.private.zsh" ]] && source "$HOME/.private.zsh"
# }}}

# Aliases to expand with space {{{
aliasestoexpand=(
  'l'
  'll'
  'download-video-as-audio'
  'vanillavim'
  't'
  'gg'
  'gc'
  'gcA'
  'gca'
  'gl'
  'gla'
  'glnm'
  'glanm'
  'ds'
  'D'
  'DS'
  'G'
  'cvim'
  'svim'
  'rm'
)
# }}}

#==============================================================================
# FUNCTIONS
#==============================================================================

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
  if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
    zle _expand_alias
    zle expand-word
  fi
  zle self-insert
}

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER='fg'
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

# Utility Functions {{{
mkcd() {
  mkdir -p $1 && cd $1
}

jobcount() {
  local jobs=$(jobs | grep ^\\\[ | wc -l | xargs)
  ((jobs)) && echo -n "$jobs "
}
# }}}

# Git Functions {{{
magic-g() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    local remote_branch=$(git rev-parse --abbrev-ref @{u} 2> /dev/null | sed 's|/.*||')
    local remote_url=$(git remote get-url $remote_branch 2> /dev/null)
    git -c color.ui=always status -sb | sed "1 s,$, => $remote_url,"
  else
    ls -laH
  fi
}

git-files-vim() {
  local root=$(git rev-parse --show-toplevel)
  local files=$(git ls-files -o --exclude-standard && git diff --name-only --cached --diff-filter=d && git diff --name-only --diff-filter=d)

  if [[ $files != "" ]]; then
    vim -c "cd $root" $(echo "$files" | xargs -I '{}' realpath --relative-to=. "$root"/'{}')
  else
    vim -c "cd $root" $(git show --name-only --diff-filter=d --pretty= | xargs -I '{}' realpath --relative-to=. "$root"/'{}')
  fi
}

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

g-diff-mega() {
  vim -p $(git diff --name-only $1) -c "tabdo :Gdiff $1" -c "tabdo :norm gg0" -c "tabdo :wincmd h" -c "tabdo :norm gg0" -c "tabfirst"
}
# }}}

