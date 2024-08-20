echo ".cfg" >> .gitignore <br/>
git clone --bare git-repo-url $HOME/.cfg <br/>
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' <br/>
config checkout <br/>
config config --local status.showUntrackedFiles no

