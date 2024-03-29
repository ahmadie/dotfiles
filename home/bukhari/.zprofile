# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH="$HOME/.cargo/bin:$PATH"

# sway wiki Development Setup
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/usr/local/lib64/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/usr/local/share/pkgconfig:$PKG_CONFIG_PATH"

# sway wiki Development Setup
export LD_LIBRARY_PATH="/usr/local/lib/:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/usr/local/lib64/:$LD_LIBRARY_PATH"

if type fcitx &> /dev/null; then
  fcitx -r
fi

# ibus-daemon

# exec pkill kanshi; exec kanshi
if type kanshi &> /dev/null; then
 kanshi
fi


#start tmux
if type tmux &> /dev/null; then
  if [ -z "$TMUX" ]; then
      cd ~
      # Create a new session if it doesn't exist
      if [[ -n $(tmux has-session -t 0 2>&1) ]]; then
        tmux new-session -d -s 0
      fi

      if [[ -n $(tmux has-session -t 1 2>&1) ]]; then
        tmux new-session -d -s 1
      fi

      if [[ -n $(tmux has-session -t 2 2>&1) ]]; then
        tmux new-session -d -s 2
      fi

      tmux attach-session -t 0
  fi
fi
