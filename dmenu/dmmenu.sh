#!/bin/bash
#
# Use: For basic tasks you want.
# Dependencies: dmenu

# configuration
dconf=$HOME/.config/dmenu/dconf
select_bg=$(awk '$1=="select_bg" {print $2}' "$dconf")
select_fg=$(awk '$1=="select_fg" {print $2}' "$dconf")

nselect_bg=$(awk '$1=="nselect_bg" {print $2}' "$dconf")
nselect_fg=$(awk '$1=="nselect_fg" {print $2}' "$dconf" )

font=$(grep "font " "$dconf" | cut -d' ' -f 2-)
font_size=$(awk '$1=="font_size" {print $2}' "$dconf")

font_size=16

declare -a options=(
    "TODO"
    "Change Background"
    "Save tabs - firefox"
    "Open saved tabs - firefox"
    "Screenshot"
    "Increase Opacity - alacritty"
    "Decrease Opacity - alacritty"
)

choice=$(printf '%s\n' "${options[@]}" | dmenu -i -l 20 -nb "$nselect_bg" -nf "$nselect_fg" -sb "$select_bg" -sf "$select_fg" -fn "$font"-"$font_size" -p 'Select option> ')

case $choice in
    'TODO')
        typora ~/Documents/study/todo.md
    ;;
    'Change Background')
        alacritty -e ranger ~/Pictures/Wallpapers
        # ~/Scripts/wallpaper.sh
    ;;
    "Save tabs - firefox")
        ~/Scripts/firefox/tabs.sh -save
    ;;
    "Open saved tabs - firefox")
        ~/Scripts/firefox/tabs.sh -open
    ;;
    "Screenshot")
        ~/Scripts/dmenu/dmscrot.sh
    ;;
    "Increase Opacity - alacritty")
        ~/Scripts/dmenu/src/alacritty_opacity.sh -inc
    ;;
    "Decrease Opacity - alacritty")
        ~/Scripts/dmenu/src/alacritty_opacity.sh -dec
    ;;
    *)
        exit 1
    ;;
esac
