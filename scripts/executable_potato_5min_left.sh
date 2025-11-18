#!/usr/bin/env bash

STATUS=$(potctl 2>/dev/null) || exit 0

TIME=$(echo "$STATUS" | awk 'NR==2 {print $3}')
PAUSED=$(echo "$STATUS" | awk 'NR==2 {print $4}')

if [ "$PAUSED" = "Yes" ]; then
    exit 0
fi

IFS=: read -r MIN SEC <<< "$TIME"
REMAIN=$((10#$MIN*60 + 10#$SEC))

if [ "$REMAIN" -le 300 ] && [ "$REMAIN" -gt 290 ]; then
    notify-send "⏳ 5 Minutes Left" "Keep going!" -u normal
fi
