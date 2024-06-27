# Start X at login
if status --is-login
    if test (tty) = /dev/tty3
        exec startx -- -keeptty
    end
end

set fish_greeting
zoxide init fish | source

function fish_user_key_bindings
  fish_vi_key_bindings
end

# Paths
set -Ux PYENV_ROOT $HOME/.pyenv
set -gx fish_user_paths $PYENV_ROOT/bin ~/.local/scripts ~/.local/share/bin ~/.local/bin ~/go/bin ~/.cargo/bin /opt/flutter/bin ~/.pub-cache/bin $fish_user_paths /opt/homebrew/bin 
set -gx SUDO_EDITOR nvim
set -gx GOPATH ~/go
set -gx EDITOR nvim


# Alias
alias gcc="/usr/bin/gcc"
alias work="lis"
alias yarn="pnpm"
alias nvm="fnm"
alias k="kubectl"
alias s="pnpm dev"
alias pn="pnpm"
alias g++="/usr/bin/g++"
alias py="python3"
alias vim="nvim"
alias vi="nvim"
alias check="./"
alias c="clear"
alias top="htop"
alias po="poetry"
alias q="exit"
alias dc="docker-compose"
alias dk="docker"
alias gs="git status"
alias lg="lazygit"
alias gch="git checkout"
alias ls="exa"
alias la="exa -la"
alias sync='osync.sh ~/.config/osync/sync.conf'
# alias yay="paru --color always"
alias du="du -h"
alias tmux="TERM=screen-256color-bce /usr/bin/tmux"
alias rm="trash"
alias space="dust -d 2"
alias tma="tmux attach -t"
alias python="python3"
alias gputop="nvtop"


# Disable ENV prompt since it is already shown on the right side
set VIRTUAL_ENV_DISABLE_PROMPT 1
set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/cuda/lib64
set -gx LANG en_US.UTF-8
set -Ux PYENV_ROOT $HOME/.pyenv
set -gx JAVA_HOME /opt/android-studio/jbr
set -gx _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on'
set -gx JAVA_FONTS /usr/share/fonts/TTF

if test -z "$XDG_CURRENT_DESKTOP"
    set -Ux XDG_CURRENT_DESKTOP GNOME
end

if test -z "$QT_QPA_PLATFORMTHEME"
   set -Ux QT_QPA_PLATFORMTHEME qt5ct
end

# Set DBUS_SESSION_BUS_ADDRESS
set -gx DBUS_SESSION_BUS_ADDRESS unix:path=/run/user/1002/bus


function ensure
    for file in .husky/*
        if test -f $file
            chmod +x $file
            $file
            chmod -x $file
        end
    end
end

atuin init fish | source
pyenv init - | source
