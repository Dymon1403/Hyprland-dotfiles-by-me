#!/bin/bash

WALL_DIR="$HOME/Pictures/Wallpapers"

# Выбираем файл. Флаг -show-icons включает картинки
selected=$(ls "$WALL_DIR" | rofi -dmenu -i -p "Обои" \
    -theme-str 'configuration { show-icons: true; } listview { columns: 3; lines: 3; } element { orientation: vertical; } element-icon { size: 200px; } element-text { horizontal-align: 0.5; }')

if [ -n "$selected" ]; then
    wallpaper="$WALL_DIR/$selected"
    swww img "$wallpaper" --transition-type center
    wal -i "$wallpaper"
fi
