#!/bin/zsh
autoload -Uz compinit
compinit
zcompdump="$HOME/.zcompdump"
zcompile "$zcompdump"

sudo su <<EOF
ryzenadj -a 15000 -b 30000 -c 20000 --power-saving
echo '1500' > '/proc/sys/vm/dirty_writeback_centisecs'
echo '0' > '/proc/sys/kernel/nmi_watchdog'
EOF