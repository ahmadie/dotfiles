# Setup fzf
# ---------
if [[ ! "$PATH" == */home/bukhari/Downloads/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/bukhari/Downloads/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/bukhari/Downloads/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/bukhari/Downloads/fzf/shell/key-bindings.zsh"
