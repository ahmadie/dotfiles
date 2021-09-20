# powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# change default shell commands
# sudo -s
# chsh -s /bin/zsh root
# chsh -s /bin/zsh bukhari

path=(${HOME}/bin ${path})
path=(${HOME}/.local/bin ${path})
path=(${HOME}/.cargo/bin ${path})
path=(${HOME}/flutter/bin ${path})

export ANDROID_SDK_ROOT=$HOME/Android
export PATH=$ANDROID_SDK_ROOT/cmdline-tools/tools:$PATH
export PATH=$ANDROID_SDK_ROOT/cmdline-tools/tools/bin:$PATH
export PATH=$ANDROID_SDK_ROOT/cmdline-tools/tools/lib:$PATH
export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH
export PATH=$ANDROID_SDK_ROOT/emulator:$PATH

export GOPATH=$HOME/work
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_301
export PATH=$JAVA_HOME/bin:$PATH


fpath=(~/.zsh/zsh-comletions/zsh-completions.plugin.zsh $fpath)

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit
compinit
zmodload zsh/complist
compinit
_comp_options+=(globdots)


# reverse menu auto complete
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey -M vicmd '^I' menu-complete
bindkey -M vicmd '^[[Z' reverse-menu-complete
# bindkey '^[[Z' reverse-menu-complete

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude .local/share/nvim/undo'

# To apply the command to CTRL-T as well
# export FZF_DEFAULT_COMMAND='rg --files' 
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_PREVIEW_PREVIEW_BAT_THEME="ayu-dark"
export BAT_THEME="ayu-dark"

alias loadnvm=". ${HOME}/.nvm/nvm.sh"
source ~/.zsh/zsh-async/async.zsh
# load nvm async https://github.com/allanjamesvestal/fast-zsh-nvm
export NVM_DIR="$HOME/.nvm"
function load_nvm() {
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

    if [ ! -z "$AUTO_LOAD_NVMRC_FILES" ] && [ "$AUTO_LOAD_NVMRC_FILES" = true ]
    then
        autoload -U add-zsh-hook
        load-nvmrc() {
            if [[ -f .nvmrc && -r .nvmrc ]]; then
                nvm use
            elif [[ $(nvm version) != $(nvm version default)  ]]; then
                echo "Reverting to nvm default version"
                nvm use default
            fi
        }
        add-zsh-hook chpwd load-nvmrc
    fi

    if [ ! -z "$LOAD_NVMRC_ON_INIT" ] && [ "$LOAD_NVMRC_ON_INIT" = true ]
    then
        load-nvmrc
    fi
}

# Initialize a new worker
async_start_worker nvm_worker -n
async_register_callback nvm_worker load_nvm
async_job nvm_worker sleep 0.1

export GTK_IM_MODULE="ibus"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/'
alias lgdotfiles='lg --work-tree / --git-dir ~/.dotfiles'

# fzf color picker =D >>> https://minsw.github.io/fzf-color-picker/
export FZF_DEFAULT_OPTS=' --color=fg:#9aedfe,bg:-1,hl:#f50062:bold 
--color=fg+:#FFFFFF 
--color=info:#f50062,prompt:-1,pointer:#af5fff 
--color=marker:#f50062,spinner:#af5fff,header:#525252 
--color=border:#57c7ff 
--preview-window=sharp 
--pointer=" " 
--marker="→" 
--border=sharp 
--prompt=" " 
--color=pointer:reverse,prompt:#57c7ff,input:159 
--color=fg+:bold,hl+:#f50062:bold'

# enable vi mode
bindkey -v

# set -o vi
export VISUAL="nvim"
export EDITOR="nvim"

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Exit menuselect
bindkey -M menuselect '\e' send-break

# allow to use v to edit command line in nvim
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^v' edit-command-line
bindkey '^v' edit-command-line

# can use comments in commandline
setopt interactivecomments

#auto full directory
setopt  autocd autopushd pushdignoredups
  
_fzf_compgen_path() {
  fd --hidden --exclude .git --exclude .local/share/nvim/undo . "$1"
}

#Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --hidden --type d --exclude .git --exclude .local/share/nvim/undo . "$1"
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_COMPLETION_TRIGGER=''
bindkey '^[[Z' fzf-completion
bindkey '^I' $fzf_default_completion
first-tab() {
    if [[ $#BUFFER == 0 ]]; then
        BUFFER="cd "
        CURSOR=3
        zle list-choices
    else
        zle expand-or-complete
    fi
}
zle -N first-tab
bindkey '^I' first-tab

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
export KEYTIMEOUT=1

alias ls='ls --color=auto -ltrh'
alias v=vifmrun
alias n=nvim
alias c=clear
alias ...=../..
alias ....=../../..
alias .....=../../../..

# got colors from here https://github.com/trapd00r/LS_COLORS
# source ~/.local/share/lscolors.sh

# https://github.com/sharkdp/vivid
export LS_COLORS="$(vivid generate ayu)"

# fzf-tab
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:*' fzf-pad 4

# start fzf-tab after ~ or /
insert-and-complete() {
   zle self-insert
   # check if string "vim" or "cd" exists in the left of cursor
   if (( $LBUFFER[(I)(nvim|cd|n|dotfiles|zfm)] != 0 )); then
       zle fzf-tab-complete
   fi
}
zle -N insert-and-complete
bindkey "/" insert-and-complete

# autosuggestions plugin
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#777777"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC='aa'

source /home/bukhari/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

function autosuggest-then-insert() {
    zle autosuggest-accept
    zle vi-add-next
}
zle -N autosuggest-then-insert
# bindkey -M vicmd 'l' autosuggest-then-insert
bindkey -M vicmd ' ' autosuggest-execute


# zsh history substing search
source /home/bukhari/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE='aa'
HISTORY_SUBSTRING_SEARCH_FUZZY='aa'
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Autojump
[[ -s /home/bukhari/.autojump/etc/profile.d/autojump.sh ]] && source /home/bukhari/.autojump/etc/profile.d/autojump.sh

# zfm
source ~/.zsh/zfm/zfm.zsh

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

eval $(thefuck --alias)


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
