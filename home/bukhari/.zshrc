# change default shell
# sudo -s
# chsh -s /bin/zsh root
# chsh -s /bin/zsh bukhari


# f fd into fzf
# fdfind --type f | fzf

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fdfind --type f'

# Now fzf (w/o pipe) will use fd instead of find
# fzf

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_COMMAND='rg --files' 
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--bind alt-j:down,alt-k:up,alt-u:up,alt-d:down,alt-i:toggle+up'

export FZF_PREVIEW_PREVIEW_BAT_THEME=""
export BAT_THEME=""


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


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

set -o vi
export VISUAL="nvim -c \"set norelativenumber nonumber nolist showtabline=0 foldcolumn=0 laststatus=0\""
export EDITOR="nvim -c \"set norelativenumber nonumber nolist showtabline=0 foldcolumn=0 laststatus=0\""

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
