#!/bin/sh

USER="iamcodernitesh"
#TOKEN=$GH_TOKEN
TOKEN=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

notifications=$(echo "user = \"$USER:$TOKEN\"" | curl -sf -K- https://api.github.com/notifications | jq ".[].unread" | grep -c true)

if [ "$notifications" -gt 0 ]; then
    echo "$notifications"
else
    echo "0"
fi
