#!/usr/bin/env bash

STATUS=$(potctl 2>/dev/null)
if [ -z "$STATUS" ]; then
    exit 0
fi

# Parse potctl output
TIME=$(echo "$STATUS" | awk 'NR==2 {print $3}' || echo "--:--")
PAUSED=$(echo "$STATUS" | awk 'NR==2 {print $4}' || echo "Yes")

# Read real session
STATE_FILE="$HOME/.config/potato/last_session"
SESSION=$(cat "$STATE_FILE" 2>/dev/null || echo "work")

# Duration presets
WORK=1800
SHORT_BREAK=300
LONG_BREAK=900

case "$SESSION" in
    work)       TOTAL=$WORK ;;
    short)      TOTAL=$SHORT_BREAK ;;
    long)       TOTAL=$LONG_BREAK ;;
esac

# Convert MM:SS → seconds
IFS=: read -r MIN SEC <<< "$TIME"
REMAIN=$((10#$MIN*60 + 10#$SEC))

# Ring progress
RING_SEGMENTS=10
FILLED=$(( (TOTAL - REMAIN) * RING_SEGMENTS / TOTAL ))

FILLED_CIRCLE="●"
EMPTY_CIRCLE="○"

RING=""
for ((i=1; i<=RING_SEGMENTS; i++)); do
    if [ "$i" -le "$FILLED" ]; then
        RING="${RING}${FILLED_CIRCLE}"
    else
        RING="${RING}${EMPTY_CIRCLE}"
    fi
done

# Icons/mode colors
case "$SESSION" in
    work)
        ICON=""
        COLOR="#cba6f7"
        ;;
    short)
        ICON=""
        COLOR="#89b4fa"
        ;;
    long)
        ICON=""
        COLOR="#89b4fa"
        ;;
esac

if [ "$PAUSED" == "Yes" ]; then
    ICON=""
    COLOR="#fab387"
fi

printf '{"text": "%s %s  %s", "class": "%s", "color": "%s"}\n' \
    "$ICON" "$TIME" "$RING" "$SESSION" "$COLOR"
