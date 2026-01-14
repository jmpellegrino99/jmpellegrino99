#!/bin/bash

exe="/Users/joepellegrino/yt-dlp"
link=$1
name=$2

bash -c "$exe -x --audio-format mp3 -o'$name' $link"

