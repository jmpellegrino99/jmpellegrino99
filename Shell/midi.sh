#!/usr/bin/bash

for file in ./*.mid; do

bname=$(echo $file | sed 's/\.mid/\.mp3/g')
timidity $file -OwS -o - | ffmpeg -i - -acodec libmp3lame -ab 64k $bname
rm $file

done