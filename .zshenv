echo ".zshenv is configuring global variables..."

# Show current directory in CLI
export PS1="[%* - %D] %d %% "

# For NPM
export PATH=/usr/local/share/npm/bin:$PATH
