# echo "\e[1;36mPreparing: Setting global variables and configure executable visability..."

function append_to_path () {
  export PATH="$PATH:$1"
}

# shell
export PS1="[%* - %D] %d %% "
export KEYTIMEOUT=1

# core
export EDITOR=vim
append_to_path "$HOME/bin" 
append_to_path "/usr/local/bin" 

# global
export OPENSSL_INCLUDE_DIR=`brew --prefix openssl`/include
export OPENSSL_LIB_DIR=`brew --prefix openssl`/lib
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
append_to_path "/usr/local/opt/openssl/bin" 

# npm
append_to_path "/usr/local/share/npm/bin" 

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
append_to_path "$PYENV_ROOT/bin" 

# rust
export RUST_SRC_PATH="/usr/local/src/rust/src"
append_to_path ".cargo/bin" 
append_to_path "/usr/local/src/racer/target/release" 

# javascript
append_to_path "`yarn global bin`" 

# java
export JAVA_HOME="$(/usr/libexec/java_home)"

# swift
export SWIFTENV_ROOT="$HOME/.swiftenv"
append_to_path "$SWIFTENV_ROOT/bin" 

# ruby
append_to_path "/.rvm/bin"

export NPM_TOKEN="e45fed38-831a-47ca-b334-5c8f6f6b371c"

# END #
# resources
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
