#!/usr/bin/env bash

get_spotify_status() {
    playerctl -p spotify status 2>/dev/null
}

get_spotify_artist() {
    playerctl -p spotify metadata artist 2>/dev/null
}

get_spotify_title() {
    playerctl -p spotify metadata title 2>/dev/null
}

STATUS=$(get_spotify_status)

if [[ -z "$STATUS" ]] || [[ "$STATUS" == "No players found" ]]; then
    exit 0
fi

ARTIST=$(get_spotify_artist)
TITLE=$(get_spotify_title)

if [[ -z "$ARTIST" ]] && [[ -z "$TITLE" ]]; then
    exit 0
fi

ARTIST="${ARTIST//&/&amp;}"
TITLE="${TITLE//&/&amp;}"
TRACK_INFO="$ARTIST - $TITLE"

PLAY_ICON=">"
if [[ "$STATUS" == "Playing" ]]; then
    PLAY_ICON="||"
fi

echo "$PLAY_ICON $TRACK_INFO"
