#!/bin/bash

MUSIC_DIR="$HOME/Музыка"
COVER="/tmp/album_cover.png"

kitty +kitten icat --clear --silent

relative_path="$(mpc --format %file% current)"
full_path="$MUSIC_DIR/$relative_path"

ffmpeg -y -i "$full_path" -an -vcodec copy "$COVER" > /dev/null 2>&1

if [ ! -f "$COVER" ]; then
    album_dir="$(dirname "$full_path")"
    find "$album_dir" -maxdepth 1 -type f \( -iname "cover.jpg" -o -iname "cover.png" -o -iname "folder.jpg" \) -exec cp {} "$COVER" \;
fi

if [ -f "$COVER" ]; then
    kitty +kitten icat --silent --hold --place 25x25@0x0 "$COVER"
fi
