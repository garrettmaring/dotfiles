# Global configs
export EDITOR=vim

# Things for the shell
alias aali="vim ~/.bashrc"
alias reload="source ~/.bash_profile"

# Things for the web
findPort() {
  lsof -wni tcp:$1
}
alias whereserver=findPort

# Things for Vim
alias v="vim"
alias vvim="vim ~/.vimrc"
alias vplugi="vim +PluginInstall +qall"

findAlias() {
  alias | grep $1
}
alias findali=findAlias

# Things for git
alias gl="git log --graph --decorate --pretty=oneline"

# Things for NPM/Node
npmInstall() {
  npm install $1 --save
}

npmInstallGlobal() {
  npm install $1 -g
}

npmInstallDev() {
  npm install $1 --save-dev
}

alias ni=npmInstall
alias nig=npmInstallGlobal
alias nid=npmInstallDev

#Thing for tmux
alias ttmux="vim ~/.tmux.conf"

# Things for Cassandra
alias startcas="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.cassandra21.plist"
alias stopcas="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.cassandra21.plist"

# Things for Apple
alias cqlitms8="/usr/local/Cellar/cassandra20/2.0.11/bin/cqlsh -k mozart_itms8 vp21q01if-ztdi23021301.vp.if1.apple.com"
alias cqldev2="/usr/local/Cellar/cassandra20/2.0.11/bin/cqlsh -k mozart_dev2 vp21q01if-ztdi23021301.vp.if1.apple.com"
