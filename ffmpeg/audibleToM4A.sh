#!/bin/sh
for i in *.aax; do ffmpeg -activation_bytes 9917290b -i "$i" -vn -c:a copy -map_metadata 0 -c copy "${i%.*}.m4a"; done