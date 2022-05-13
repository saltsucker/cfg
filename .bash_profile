# if [ -d "/etc/sway" ] && [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
# 	exec sway
# fi
# if [[ -d "/etc/sway" ]]; then
# 	export QT_SCALE_FACTOR=1
# 	export QT_QPA_PLATFORM=wayland
# 	export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
# 	export XDG_SESSION_TYPE=wayland
# 	export MOZ_ENABLE_WAYLAND=1
# 	export GDK_BACKEND=wayland
# fi
# export RANGER_LOAD_DEFAULT_RC=FALSE

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

# PATH
export PATH="/home/wj/.local/bin:$PATH"
export REF="~/files/ref"
export SHELLRC="$HOME/.bashrc"
export EDITOR="emacsclient -tn"
export VISUAL="emacsclient -cn"
[[ -f $SHELLRC ]] && . $SHELLRC

