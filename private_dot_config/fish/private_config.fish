set -g -x PATH $PATH /opt/homebrew/bin
ulimit -n 4096

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source


zoxide init fish | source

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# if test -n "$SSH_CONNECTION"
#     echo "🚀 SSH detected, using system git"
#     set -x PATH /usr/bin $PATH
# end
 
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bko/.local/google-cloud-sdk/path.fish.inc' ]; . '/Users/bko/.local/google-cloud-sdk/path.fish.inc'; end

set -gx EZA_CONFIG_DIR "/Users/bko/.config/eza"

