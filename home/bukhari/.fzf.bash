# Setup fzf
# ---------
if [[ ! "$PATH" == */home/bukhari/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/bukhari/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/bukhari/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/bukhari/.fzf/shell/key-bindings.bash"
