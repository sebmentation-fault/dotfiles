# source zsh completions
fpath+=~/.zfunc
source $HOME/.config/zsh/completion.zsh
source <(fzf --zsh)

# do not save duplicates
setopt HIST_SAVE_NO_DUPS

# pnpm
export PNPM_HOME="/Users/sebastiankjallgren/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# starship prompt
eval "$(starship init zsh)"


