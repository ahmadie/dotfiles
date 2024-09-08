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
path=(/usr/local/bin/nvim-linux64/bin ${path})

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


fpath=(~/.zsh/zsh-completions/zsh-completions.plugin.zsh $fpath)

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

#remove indent from right-site
ZLE_RPROMPT_INDENT=0

# reverse menu auto complete
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey -M vicmd '^I' menu-complete
bindkey -M vicmd '^[[Z' reverse-menu-complete
# bindkey '^[[Z' reverse-menu-complete

# enable vi mode
bindkey -v

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude .local/share/nvim/undo'

# To apply the command to CTRL-T as well
# export FZF_DEFAULT_COMMAND='rg --files' 
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git --exclude .local/share/nvim/undo --search-path ~"

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

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=/'
alias lgdotfiles='lg --work-tree / --git-dir ~/.dotfiles'
# then dotfiles reset --keep (for home PC machine it works flawlessly)

alias lg='lazygit'
alias v='nvim'

# fzf color picker =D >>> https://minsw.github.io/fzf-color-picker/
export FZF_DEFAULT_OPTS=' --color=fg:#cdd6f4,bg:-1,hl:#f38ba8:bold 
--color=fg+:#f5e0dc 
--color=info:#f38ba8,prompt:-1,pointer:#af5fff 
--color=marker:#f38ba8,spinner:#f5e0dc,header:#525252 
--color=border:#57c7ff 
--preview-window=sharp 
--no-separator 
--no-scrollbar 
--pointer=" " 
--reverse 
--marker="→" 
--prompt=" " 
--color=pointer:reverse,prompt:#cba6f7,input:159 
--color=fg+:bold,hl+:#f38ba8:bold'

# set -o vi
export VISUAL="nvim"
export EDITOR="nvim"

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
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt sharehistory
setopt appendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
export KEYTIMEOUT=1

alias ls='ls --color=auto -ltrh'
# alias v=vifmrun
alias n=nvim
alias c=clear
alias ...=../..
alias ....=../../..
alias .....=../../../..

# https://github.com/sharkdp/vivid
export LS_COLORS="$(vivid generate catppuccin-mocha)"
# export LS_COLORS="$(vivid -m 8-bit generate catppuccin-mocha)"

# fzf-tab
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:*' fzf-pad 4

# autosuggestions plugin
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#777777"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC='aa'

source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

function autosuggest-then-insert() {
    zle autosuggest-accept
    zle vi-add-next
}
zle -N autosuggest-then-insert
# bindkey -M vicmd 'l' autosuggest-then-insert
bindkey -M vicmd ' ' autosuggest-execute


# zsh history substing search
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE='aa'
HISTORY_SUBSTRING_SEARCH_FUZZY='aa'
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# fzf-commands-bookmarks
source ~/.zsh/fzf-command-bookmarks/fzf-command-bookmarks.sh
export FZF_COMMAND_BOOKMARKS_ADD="\C-k"
export FZF_COMMAND_BOOKMARKS_SHOW="\C-o"
export FZF_COMMAND_BOOKMARKS_FILE=~/.fzf-command-bookmarks.txt

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
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
