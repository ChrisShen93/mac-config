eval "$(sheldon source)"

# history-substring-search keybindings (must be after plugin load)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

alias vim="nvim"

eval "$(starship init zsh)"

export PATH=$HOME/.local/bin:$PYENV_ROOT/bin:$HOME/.bun/bin:$HOME/go/bin:$PATH

# for opencode
export EDITOR=vim

