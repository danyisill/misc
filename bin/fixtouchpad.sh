#!/bin/bash
touchpad=$(libinput list-devices | sed -rn '/Touchpad/{n;s/.*(event[0-9]+)/\1/p}')
dbus-send --dest=org.kde.KWin "/org/kde/KWin/InputDevice/$touchpad" org.freedesktop.DBus.Properties.Set string:org.kde.KWin.InputDevice string:pointerAcceleration variant:double:0.6
dbus-send --dest=org.kde.KWin "/org/kde/KWin/InputDevice/$touchpad" org.freedesktop.DBus.Properties.Set string:org.kde.KWin.InputDevice string:pointerAccelerationProfileFlat variant:bool:true
dbus-send --dest=org.kde.KWin "/org/kde/KWin/InputDevice/$touchpad" org.freedesktop.DBus.Properties.Set string:org.kde.KWin.InputDevice string:pointerAccelerationProfileAdaptive variant:bool:false