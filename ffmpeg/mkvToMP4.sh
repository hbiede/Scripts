#!/bin/sh
for i in *.mkv; 
do ffmpeg -i "$i" "${i%.*}.mp4"; rm "$i.mkv";
done
