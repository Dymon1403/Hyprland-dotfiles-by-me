#!/bin/bash
trap "pkill cava" EXIT

# Запускаем cava
cava -p ~/.config/cava/config_waybar | sed -u 's/;//g;s/0/ /g;s/1/▂/g;s/2/▃/g;s/3/▄/g;s/4/▅/g;s/5/▆/g;s/6/▇/g;s/7/█/g' | while read -r bars; do
    status=$(playerctl status 2>/dev/null)
    
    if [ "$status" = "Playing" ]; then
        title=$(playerctl metadata --format "{{ artist }} - {{ title }}")
        # Обрезаем, чтобы не прыгало, и добавляем столбики
        echo "${title:0:25} <span alpha='50%'>$bars</span>"
    elif [ "$status" = "Paused" ]; then
        # Та самая "крутая штучка" для паузы
        echo "   Paused"
    else
        echo "   Stopped"
    fi
done
