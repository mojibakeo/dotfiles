set -g fish_user_paths /opt/homebrew/opt/mysql-client/bin $fish_user_paths
set -g fish_user_paths /opt/homebrew/bin $fish_user_paths
set -g fish_user_paths /opt/homebrew/sbin $fish_user_paths
set -g fish_user_paths $HOME/.local/bin $fish_user_paths
set -g fish_user_paths $HOME/.cargo/bin $fish_user_paths

set -gx ANDROID_HOME $HOME/Library/Android/Sdk
set -gx ANDROID_SDK_ROOT $HOME/Library/Android/Sdk

set -g fish_user_paths $ANDROID_HOME/emulator $fish_user_paths
set -g fish_user_paths $ANDROID_HOME/tools $fish_user_paths
set -g fish_user_paths $ANDROID_HOME/tools-bin $fish_user_paths
set -g fish_user_paths $ANDROID_HOME/platform-tools $fish_user_paths

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths $HOME"/.local/bin" $fish_user_paths

