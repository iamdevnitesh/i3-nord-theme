#/bin/bash

id=$(pgrep -f "polybar -r bottom")

if [ $id ]; then
    polybar-msg -p $id cmd toggle 
fi
