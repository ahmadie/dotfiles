# Setup fzf
# ---------
if [[ ! "$PATH" == */home/bukhari/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/bukhari/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/bukhari/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/bukhari/.fzf/shell/key-bindings.zsh"


# Use fd and fzf to get the args to a command.
# Works only with zsh
# Examples:
# f mv # To move files. You can write the destination after selecting the files.
# f 'echo Selected:'
# f 'echo Selected music:' --extention mp3
# fm rm # To rm files in current directory
d() {
    sels=( "${(@f)$(fd "${fd_default[@]}" "${@:2}"| fzf)}" )
    test -n "$sels" && print -z -- "$1 ${sels[@]:q:q}"
}

# Like f, but not recursive.
dm() d "$@" --max-depth 1

# Deps
alias fz="fzf-noempty --bind 'tab:toggle,shift-tab:toggle+beginning-of-line+kill-line,ctrl-j:toggle+beginning-of-line+kill-line,ctrl-t:top' --color=light -1 -m"
fzf-noempty () {
	local in="$(</dev/stdin)"
	test -z "$in" && (
		exit 130
	) || {
		ec "$in" | fzf "$@"
	}
}
ec () {
	if [[ -n $ZSH_VERSION ]]
	then
		print -r -- "$@"
	else
		echo -E -- "$@"
	fi
}
#-----------------

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
    local pid 
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi  

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi  
}
#---------------


# fd - cd to selected directory
fcd() {
  local dir
  dir=$(fd --type f --hidden --follow --exclude .git --exclude .local/share/nvim/undo | fzf +m)
  cd "$dir"
}

# fda - including hidden directories
fcda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# use fd / fzf to navigate fast
ff () {
  cd "$( fd --hidden --type d --exclude .git --exclude .local/share/nvim/undo $* | fzf -1 -0 +m )"
}

ffh () {
  cd "$( fd --hidden --type d --exclude .git --exclude .local/share/nvim/undo $* ~ | fzf -1 -0 +m )"
}
# -----------
