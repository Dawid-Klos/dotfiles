#!/usr/bin/env bash

potctl -r
sleep 0.1

STATUS=$(potctl 2>/dev/null)
PAUSED=$(echo "$STATUS" | awk 'NR==2 {print $4}')

if [ "$PAUSED" = "Yes" ]; then
    notify-send " Paused" "Timer is paused." -u normal
fi
