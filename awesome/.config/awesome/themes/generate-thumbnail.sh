#!/bin/bash

rm -rf wallpapers/thumbnails
mkdir -p wallpapers/thumbnails

for file in wallpapers/*.{jpg,png}; do 
  filename=$(basename "$file"); 
  ffmpeg -i "$file" -vf "scale=160:90" "wallpapers/thumbnails/${filename}" 
done
