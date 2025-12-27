#!/bin/bash

THRESHOLD=70
RAM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
USAGE_INT=${RAM_USAGE%.*}
echo "usage: $USAGE_INT%"
if [ "$USAGE_INT" -gt "$THRESHOLD" ]; then
    DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "RAM Warning" "Hey Mahmoud, RAM Usage is $USAGE_INT%" --icon=dialog-warning
fi
#END
