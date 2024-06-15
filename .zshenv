export EDITOR="nvim"
export VISUAL="nvim"

source ~/.aliases

# cap history size at 10_000
export HISTSIZE=10000
export SAVEHIST=10000

# Change golang module path from default (in home directory)
export GOPATH=$HOME/.go

# add directories to the PATH
add_to_path() {
    if [ -d "$1" ]; then
        export PATH="$1:$PATH"
    fi
}

# custom scripts i made
add_to_path $HOME/.local/bin/
# add gopls, gofmt, and utils like air to the path 
add_to_path /usr/local/go/bin/
add_to_path $GOPATH/bin/

#  source/load rust/cargo environment variables
. "$HOME/.cargo/env"
