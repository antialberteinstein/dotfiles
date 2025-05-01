# Set theme
# set -g theme_color_scheme nord
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes


omf theme agnoster

set -x GIT_CONFIG_GLOBAL $HOME/.config/git/config

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/nhat/.lmstudio/bin
# End of LM Studio CLI section

