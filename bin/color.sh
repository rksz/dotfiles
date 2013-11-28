#!/bin/sh
# $'...' 内は\ で特殊文字が入れられる
color_red=$'\e[31m'
color_green=$'\e[32m'
color_brown=$'\e[33m'
color_blue=$'\e[34m'
color_purple=$'\e[35m'
color_cyan=$'\e[36m'
color_light_gray=$'\e[37m'

for color in ${!color_*}; do
  echo "${!color}${color#color_}"$'\e[0m'
done
