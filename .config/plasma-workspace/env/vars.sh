#!/bin/bash
#export MOZ_DISABLE_RDD_SANDBOX=1
#export GTK_USE_PORTAL=1
export SSH_ASKPASS='/usr/bin/ksshaskpass'
eval $(ssh-agent)
if pgrep -f startplasma-wayland
then
	export MOZ_ENABLE_WAYLAND=1
	export MOZ_USE_XINPUT2=1
	export QT_QPA_PLATFORM=wayland
	#export SDL_VIDEODRIVER=wayland
fi
