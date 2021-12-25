#!/bin/bash

# check if pid is working and if working then kill it

id=pgrep -f eww

if [ -f id ]; then
    #kill -9 $(id)
    killall -9 eww
else
    bash $HOME/.config/eww/launch_eww
fi
