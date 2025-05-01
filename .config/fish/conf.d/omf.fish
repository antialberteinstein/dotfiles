# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/fish/omf"
  or set -gx OMF_PATH "$HOME/.local/share/fish/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
