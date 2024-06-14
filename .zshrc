# source zsh completions
source $HOME/.config/zsh/completion.zsh
source <(fzf --zsh)

# do not save duplicates
setopt HIST_SAVE_NO_DUPS

# starship prompt
eval "$(starship init zsh)"
