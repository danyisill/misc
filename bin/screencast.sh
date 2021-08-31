#!/usr/bin/env zsh
zparseopts -D -E -- f=fullscreen b:=bitrate
if [[ -z "${fullscreen[1]}" ]]; then
	slop=$(slop -f '%x %y %w %h')
	read -r X Y W H < <(echo $slop)
	CROP=",crop=$W:$H:$X:$Y"
else
	IFS="," read -r W H < /sys/class/graphics/fb0/virtual_size
	CROP=""
fi
if [[ -z "${bitrate[2]}" ]]; then
	B="5M"
else
	B="${bitrate[2]}"
fi
ffmpeg -framerate 60 -f kmsgrab -i - -vf "fps=60,hwmap=derive_device=vaapi${CROP},scale_vaapi=w=${W}:h=${H}:format=nv12" -c:v h264_vaapi -b:v "$B" $*