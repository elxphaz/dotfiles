#!/usr/bin/env bash

case "$1" in
    "play-pause")
        playerctl -p spotify play-pause
        ;;
    "next")
        playerctl -p spotify next
        ;;
    "previous")
        playerctl -p spotify previous
        ;;
    *)
        echo "Usage: $0 {play-pause|next|previous}"
        exit 1
        ;;
esac
