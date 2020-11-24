# change default shell commands
# sudo -s
# chsh -s /bin/zsh root
# chsh -s /bin/zsh bukhari


path=(${HOME}/bin ${path})
path=(${HOME}/.local/bin ${path})
path=(${HOME}/.cargo/bin ${path})



# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)


# rever menu auto complete
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey -M vicmd '^I' menu-complete
bindkey -M vicmd '^[[Z' reverse-menu-complete
# bindkey '^[[Z' reverse-menu-complete

# f fd into fzf
# fdfind --type f | fzf

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude .local/share/nvim/undo'

# Now fzf (w/o pipe) will use fd instead of find
# fzf

# To apply the command to CTRL-T as well
# export FZF_DEFAULT_COMMAND='rg --files' 
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--bind alt-j:down,alt-k:up,alt-u:up,alt-d:down,alt-i:toggle+up'

export FZF_PREVIEW_PREVIEW_BAT_THEME="Monokai Extended Origin"
export BAT_THEME="Monokai Extended Origin"


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

#  [ -f ~/.fzf.bash ] && source ~/.fzf.bash

export GTK_IM_MODULE="ibus"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/'
alias lgdotfiles='lg --work-tree / --git-dir ~/.dotfiles'

# fzf color picker =D >>> https://minsw.github.io/fzf-color-picker/
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#d0d0d0,bg:-1,hl:#5f87af 
--color=fg+:#d0d0d0,hl+:#f50062 
--color=info:#f50062,prompt:-1,pointer:#af5fff 
--color=marker:#f50062,spinner:#af5fff,header:#525252 
--color=border:#57c7ff 
--preview-window=sharp 
--pointer=" " 
--marker="→" 
--border=sharp
--color=pointer:reverse,prompt:reverse,input:159 
--color=fg+:italic,hl:underline:-1,hl+:italic:underline:reverse:-1'

# enable vi mode
bindkey -v
# set -o vi
export VISUAL="nvim -c \"set norelativenumber nonumber nolist showtabline=0 foldcolumn=0 laststatus=0\""
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

#auto full directory
setopt  autocd autopushd pushdignoredups
  
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY
export KEYTIMEOUT=1

# fpath+=$HOME/.zsh/pure
# autoload -U promptinit; promptinit
# prompt pure

alias ls='ls --color=auto'
alias v=vifmrun
# alias vifm=vifmrun
alias n=nvim
alias c=clear

# got colors from here https://github.com/trapd00r/LS_COLORS
# source ~/.local/share/lscolors.sh

# https://github.com/sharkdp/vivid
export LS_COLORS="$(vivid generate ~/.config/vivid/themes/molokai.yml)"

# autosuggestions plugin
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#777777"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC='aa'

source /home/bukhari/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

eval "$(starship init zsh)"

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
