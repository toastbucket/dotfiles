# Setup fzf
# ---------
if [[ ! "$PATH" == */home/nelsmore/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/nelsmore/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/nelsmore/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/nelsmore/.fzf/shell/key-bindings.zsh"

# Defaults
# --------
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_OPS='-m --height 50% --border'
