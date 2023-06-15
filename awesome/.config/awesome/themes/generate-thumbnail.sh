#!/bin/bash

rm -rf wallpapers/thumbnails
mkdir -p wallpapers/thumbnails

for file in wallpapers/*.{jpg,png}; do 
  filename=$(basename "$file"); 
  ffmpeg -i "$file" -vf "scale=80:45" "wallpapers/thumbnails/${filename}" 
done
