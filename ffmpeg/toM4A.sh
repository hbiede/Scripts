#!/bin/sh
for i in *.mkv; do ffmpeg -i "$i" -map_metadata 0 -c copy "${i%.*}.mp4"; done