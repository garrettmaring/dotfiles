echo ".zshenv is configuring global variables for you to break everything with..."

# Show current directory in CLI
export PS1="[%* - %D] %d %% "

# For NPM
export PATH=/usr/local/share/npm/bin:$PATH
