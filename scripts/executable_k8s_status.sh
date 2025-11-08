#!/usr/bin/env bash

ENV_FILE="${HOME}/scripts/.env"
if [[ -f "$ENV_FILE" ]]; then
    source "$ENV_FILE"
else
    echo "Error: $ENV_FILE not found" >&2
    exit 1
fi

NEXTCLOUD_URL="${NEXTCLOUD_URL:-http://localhost:8001}"
PIHOLE_URL="${PIHOLE_URL:-http://localhost:8002/admin}"
BACKEND_URL="${BACKEND_URL:-http://localhost:8080}"

check_http() {
    local url=$1
    if curl -s --max-time 5 "$url" >/dev/null; then
        echo ""
    else
        echo ""
    fi
}

NEXTCLOUD_STATUS=$(check_http "$NEXTCLOUD_URL")
PIHOLE_STATUS=$(check_http "$PIHOLE_URL")
BACKEND_STATUS=$(check_http "$BACKEND_URL")

if [[ "$NEXTCLOUD_STATUS$PIHOLE_STATUS$BACKEND_STATUS" == *"✖"* ]]; then
    CLASS="k8s-down"
else
    CLASS="k8s-up"
fi

printf '{"text": "Nextcloud: %s | PiHole: %s | STF: %s ", "tooltip": "K8s service status", "class": "%s"}' \
    "$NEXTCLOUD_STATUS" "$PIHOLE_STATUS" "$BACKEND_STATUS" "$CLASS"
