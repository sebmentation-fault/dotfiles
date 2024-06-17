# source zsh completions
source $HOME/.config/zsh/completion.zsh
source <(fzf --zsh)

# the user-ruby has to be different to the system ruby (only on macOS)
# this sets the ruby version to a more recent one
if [[ "$(uname -s)" == "Darwin" ]]; then
	source /usr/local/opt/chruby/share/chruby/chruby.sh
	source /usr/local/opt/chruby/share/chruby/auto.sh
	chruby ruby-3.1.3
fi

# do not save duplicates
setopt HIST_SAVE_NO_DUPS

# starship prompt
eval "$(starship init zsh)"

