# echo "Performing minor ritual: Loading plugins, configuring shell, initializing environment managers..."

# Antigen
source $(brew --prefix)/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle git
# antigen bundle pip
antigen bundle command-not-found
antigen bundle colorize
antigen bundle vagrant
antigen bundle brew
antigen bundle lukechilds/zsh-nvm

# Load the theme.
antigen theme agnoster 

# Tell antigen that you're done.
antigen apply

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Global configs

# Add user bin to path

# Zsh vim mode
bindkey -v
bindkey '^?' backward-delete-char
bindkey '^w' backward-kill-word

# Configure the Prompt
precmd() {
  RPROMPT=""
}

zle-keymap-select() {
  RPROMPT=""
  [[ $KEYMAP = vicmd ]] && RPROMPT="NORMAL"
  () { return $__prompt_status }
  zle reset-prompt
}

zle-line-init() {
  typeset -g __prompt_status="$?"
}

# These attach the above widgets to the zle functions that get called on mode changes
zle -N zle-keymap-select
zle -N zle-line-init
# Reduce the time zsh takes to check for special characters

# Fasd
eval "$(fasd --init auto)"
alias ds="fasd -d | tr -s ' ' | cut -d ' ' -f 2"
unalias z
function z () {
  cd $(ds | fzf)
}

# fzf
# fe (renamed vf) [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
vf() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# Things for the shell

# Rust
# Rust source on load
source $HOME/.cargo/env

findAlias() {
  alias | grep $1
}
alias fali=findAlias
alias aali="nvim ~/.zshrc"
alias reload="source ~/.zshrc"
alias la="ls -la"

# File System & Navigation {{{
# Make a new directory and cd into it {{{
mkCd() {
  mkdir $1 && cd $1
}
alias mkcd=mkCd
# }}}
# Create a new note in the current directory with vim-note {{{
newVimNote() {
  v note:$1
}
alias vn=newVimNote
# }}}
# }}}
# Scripts {{{
alias ffws="findFilesWithString"
alias work="bash ~/Scripts/WorkScripts/launch_work_setup.sh"
# }}}

# Things for the web
findPort() {
  lsof -wni tcp:$1
}
alias whereserver=findPort

# Things for Vim
alias v="nvim"
alias vvim="nvim ~/.vimrc"
alias vplugi="nvim +PluginInstall +qall"
# Making ctrl-h work in neovim
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > ~/$TERM.ti
tic ~/$TERM.ti

# Things for git
alias gs="git status"
alias gl="git log --graph --decorate --pretty=oneline"
alias gaa="git add ."
alias gcan="git commit --amend --no-edit"
alias gpoh="git push origin HEAD"
alias gpohf="git push origin HEAD --force"
# Get path of root directory in git repo
alias groot="git rev-parse --show-toplevel"

# Things for NPM/Node
alias nis="npm install --save"
alias nid="npm install --save-dev"
alias nig="npm install --global"
alias nt="npm test"
alias nit="npm install && npm test"
alias nk="npm link"
alias nr="npm run"
alias nf="npm cache clean && rm -rf node_modules && npm install"

# Things for Javascript

# Things for Java

# Thing for tmux
alias ttmux="nvim ~/.tmux.conf"
alias t2="tmux -2"
alias tkill="tmux kill-session"

# Things for Cassandra
alias localcas="cqlsh 127.0.0.1 --cqlversion=3.1.7"
alias startcas="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.cassandra.plist"
alias stopcas="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.cassandra.plist"

# Things for local machine
alias showhidden="defaults write com.apple.finder AppleShowAllFiles YES"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles NO"
alias sleep="pmset sleepnow"

# Things for Casa
alias rlc="sh lib/scripts/relink_command.sh"

# Things for Python
#alias python="python3"
#alias pip="pip3"
if hash pyenv 2>/dev/null; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# Things for Swift
alias sb="swift build"
alias sbc="swift build --clean"
if hash swiftenv 2>/dev/null; then
  eval "$(swiftenv init -)";
fi

# Kill a process if exists
function killProc() {
  if pgrep $1; then pkill $1; fi
}

# nomouse (send to background)
function nomouse() {
  if pgrep nomouse
  then
    killProc nomouse
    brightness 1
  else
    $HOME/bin/nomouse &
  fi
}

alias nomouse=nomouse

# Misc.
alias google="googler -n5"
alias c="clear"
alias t="trash"
alias uuid="python -c 'import sys,uuid; sys.stdout.write(str(uuid.uuid4()).upper());sys.stdout.write(\"\n\")'"
 
# ruby
eval "$(rbenv init -)"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/garrettmaring/.npm/_npx/3430/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/garrettmaring/.npm/_npx/3430/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh