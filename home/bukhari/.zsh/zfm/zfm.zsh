function __zfm_select_bookmarks()
{
    setopt localoptions pipefail no_aliases 2> /dev/null
    local opts="--reverse --exact --no-sort --cycle --height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS"
    __zfm_decorate | FZF_DEFAULT_OPTS="$@ ${opts}" fzf | awk '{ $NF=""; print $0 }'
}

function __zfm_select_with_query()
{
    setopt localoptions pipefail no_aliases 2> /dev/null
    local opts="--reverse --exact --no-sort --cycle --height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS"
    __zfm_decorate | FZF_DEFAULT_OPTS="${opts}" fzf -q "$@" -1 -0 | awk '{ print $1 }'
}

function __zfm_filter_files()
{
    while read line
    do
        if [ -f $line ]; then
            echo $line
        fi
    done
}

function __zfm_filter_dirs()
{
    while read line
    do
        if [ -d $line ]; then
            echo $line
        fi
    done
}

function __zfm_filter_commands()
{
    while read line
    do
        if [[ ! -d $line ]] && [[ ! -e $line ]]; then
            echo $line
        fi
    done
}


function __zfm_decorate()
{
    while read line
    do
        if [ ! -z "$line" ];then
            if [ -d "$line" ]; then
                echo "$line"@"[d]"
            elif [ -f "$line" ]; then
                echo "$line"@"[f]"
            else
                echo "$line"@"[c]" 
            fi
        fi
    done | column -t -s '@'
}

function __zfm_filter_non_existent()
{
    while read line
    do
        # if [[ -d $line ]] || [[ -e $line ]]; then
            echo $line
        # fi
    done
}

function __zfm_check_regex()
{
    local command="$1"
    local regex="$2"
    shift 2
    for arg in "$@"
    do
        if ! [[ "$arg" =~ "$regex" ]]; then
            echo "Invalid Argument for command ${command}: '${arg}'"
            return 1
        fi
    done
}

function __zfm_add_items_to_file()
{
    for var in "${@:2}"
    do
        local item=${var:A}
        if [ ! -e "$item" ] && [ ! -d "$item" ]; then
            echo "$item" does not exist!
            return 1
        fi
        echo "$item" >> "$1"
        echo "$item" added!
    done
    local contents=$(cat "$1")
    echo "$contents" | awk '!a[$0]++' > "$1"
}

function __zfm_add_command_to_file()
{
    echo "${@:2}" >> "$1"
    echo "$item" added!
    local contents=$(cat "$1")
    echo "$contents" | awk '!a[$0]++' > "$1"
}

function __zfm_cleanup()
{
    local old_length=$(wc -l "$1" | cut -d\  -f 1)
    local contents=$(cat "$1")
    echo "$contents" | awk '!a[$0]++' | __zfm_filter_non_existent > $1
    local new_length=$(wc -l "$1" | cut -d\  -f 1)
    echo "removed" $(( $old_length - $new_length)) "entries"
}

usage="$(basename "$0") [-h] <command> [opts] -- fuzzy marks

commands:

list [--files] [--dirs]                 list bookmarks
add <path> [paths...]                   bookmark items
select [--files] [--dirs] [--multi]     select bookmark(s) and print selection to sdtout
query <pattern>                         Query bookmark matching <pattern> and print match to stdout. Selection menu will open if match is ambiguous.
edit                                    edit bookmarks file
fix                                     remove bookmarked that no longer exist
clear                                   clear all bookmarks

options:

-h,--help                               show help
--files                                 restrict to files only
--dirs                                  restrict to dirs only
--multi                                 allow multiple selection of items

Default Keybindings:

Ctrl+P                                  Select a bookmarked directory and jump to it
Ctrl+O                                  Select one or multiple bookmarks and insert them into the current command line
Ctrl+B                                  Select one or multiple commands and insert them into the current command line
"

function zfm()
{
    local bookmarks_file="${HOME}/.zfm.txt"
    if [ ! -e "$bookmarks_file" ]; then
        touch "$bookmarks_file"
    fi
    case "$1" in
        'list')
            __zfm_check_regex "$1" '(--files|--dirs|--commands)' "${@:2}" || return 1
            if [[ $* == *--files* ]]; then
                cat "$bookmarks_file" | __zfm_filter_files | __zfm_decorate
            elif [[ $* == *--dirs* ]]; then
                cat "$bookmarks_file" | __zfm_filter_dirs | __zfm_decorate
            elif [[ $* == *--commands* ]]; then
                cat "$bookmarks_file" | __zfm_filter_commands | __zfm_decorate
            else
                cat "$bookmarks_file" | __zfm_decorate
            fi
            ;;
        'select')
            __zfm_check_regex "$1" '(--multi|--files|--dirs|--commands)' "${@:2}" || return 1
            [[ $* == *--multi* ]] && local multi="-m"
            if [[ $* == *--files* ]]; then
                cat "$bookmarks_file" | __zfm_filter_files | __zfm_select_bookmarks "${multi}"
            elif [[ $* == *--dirs* ]]; then
                cat "$bookmarks_file" | __zfm_filter_dirs | __zfm_select_bookmarks "${multi}"
            elif [[ $* == *--commands* ]]; then
                cat "$bookmarks_file" | __zfm_filter_commands | __zfm_select_bookmarks "${multi}"
            else
                cat "$bookmarks_file" | __zfm_select_bookmarks "${multi}"
            fi
            ;;
        'add')
            __zfm_add_items_to_file "$bookmarks_file" "${@:2}" || return 1
            ;;
        'addc')
            __zfm_add_command_to_file "$bookmarks_file" "${@:2}" || return 1
            ;;
        'query')
            if [[ "$2" == "--files" ]]; then
                cat "$bookmarks_file" | __zfm_filter_files | __zfm_select_with_query "${@:3}"
            elif [[ "$2" == "--dirs" ]]; then
                cat "$bookmarks_file" | __zfm_filter_dirs | __zfm_select_with_query "${@:3}"
            else
                cat "$bookmarks_file" | __zfm_select_with_query "$2"
            fi
            ;;
        'fix')
            ! [[  -z "${@:2}" ]] && echo "Invalid option '${@:2}' for '$1'" && return 1
            __zfm_cleanup "$bookmarks_file"
            ;;
        'clear')
            ! [[  -z "${@:2}" ]] && echo "Invalid option '${@:2}' for '$1'" && return 1
            echo "" > "$bookmarks_file"
            echo "bookmarks deleted!"
            ;;
        'edit')
            ! [[  -z "${@:2}" ]] && echo "Invalid option '${@:2}' for '$1'" && return 1
            ${EDITOR:-vim} "$bookmarks_file"
            ;;
        *)
            echo "$usage" >&2
            echo "Unknown command $1"
            ;;
    esac
}

#######################################################################
# CTRL-B - insert command
function __zfm_append_command_to_prompt()
{
    if [[ -z "$1" ]]; then
        zle fzf-redraw-prompt
        return 0
    fi
    LBUFFER="${LBUFFER}$(echo "$1" | tr '\r\n' ' '| sed -e 's/\s$//')"
    local ret=$?
    zle fzf-redraw-prompt
    return $ret
}
function zfm-insert-command
{
    __zfm_append_command_to_prompt "$(zfm select --commands)"
}
zle     -N    zfm-insert-command
bindkey '^B' zfm-insert-command

#######################################################################
# CTRL-O - insert bookmark
function __zfm_append_to_prompt()
{
    if [[ -z "$1" ]]; then
        zle fzf-redraw-prompt
        return 0
    fi
    LBUFFER="${LBUFFER}$(echo "$1" | tr '\r\n' ' '| sed -e 's/\s$//')"
    local ret=$?
    zle fzf-redraw-prompt
    return $ret
}
function zfm-insert-bookmark()
{
    __zfm_append_to_prompt "$(zfm select --multi)"
}
zle     -N    zfm-insert-bookmark
bindkey '^O' zfm-insert-bookmark

#######################################################################
# CTRL-P - cd into bookmarked directory
zfm-cd-to-bookmark() {
local dir=$(zfm select --dirs)
if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
fi
cd "$dir"
local ret=$?
zle fzf-redraw-prompt
return $ret
}
zle     -N    zfm-cd-to-bookmark
bindkey '^P' zfm-cd-to-bookmark

#######################################################################
# f - jump to directory with query
function f()
{
    if [ -z "$@" ]; then
        local dir=$(zfm select --dirs)
    else
        local dir=$(zfm query --dirs "$@")
    fi
    if [[ -z "$dir" ]]; then
        return 0
    fi
    cd "$dir"
}
