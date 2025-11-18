#!/bin/bash

CACHE_FILE="/tmp/yay-updates-count"
NOTIFIED_FILE="/tmp/yay-updates-notified"

# Get update count
updates=$(yay -Qu 2>/dev/null | wc -l)

# Save current count
echo "$updates" > "$CACHE_FILE"

# Read last notified count
last_notified=0
if [ -f "$NOTIFIED_FILE" ]; then
    last_notified=$(cat "$NOTIFIED_FILE")
fi

if [ "$updates" -gt 0 ] && [ "$updates" != "$last_notified" ]; then
notify-send \
  --app-name="System Updates" \
  " System Update" \
  "$updates package(s) available" \
  2>> /tmp/check-updates.log
elif [ "$updates" -eq 0 ]; then
    # No updates - clear notified state
    rm -f "$NOTIFIED_FILE" 2>/dev/null
fi
