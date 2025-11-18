#!/usr/bin/env bash

WORK=1800
SHORT_BREAK=300
LONG_BREAK=900

STATE_FILE="$HOME/.config/potato/last_session"
LAST_SESSION=$(cat "$STATE_FILE" 2>/dev/null || echo "long")

case "$LAST_SESSION" in
    work)
        NEXT_SESSION="short"
        DURATION=$SHORT_BREAK
        MESSAGE="Short Break — 5 min"
        ICON="☕"
        ;;
    short)
        NEXT_SESSION="long"
        DURATION=$LONG_BREAK
        MESSAGE="Long Break — 15 min"
        ICON="☕"
        ;;
    long|*)
        NEXT_SESSION="work"
        DURATION=$WORK
        MESSAGE="Work — 30 min"
        ICON=""
        ;;
esac

/usr/bin/potctl -s "$DURATION"
echo "$NEXT_SESSION" > "$STATE_FILE"

/usr/bin/notify-send "$ICON $MESSAGE" "Session started." -u normal
