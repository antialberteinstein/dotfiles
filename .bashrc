# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc

# Auto start tmux

# Add my specific bin folder to PATH
export PATH=$HOME/Applications/bin:$HOME/scripts/bin/:$PATH

export GIT_CONFIG_GLOBAL=$HOME/.config/git/config

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/nhat/.lmstudio/bin"
# End of LM Studio CLI section

