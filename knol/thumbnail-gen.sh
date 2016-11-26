#!/bin/bash

# script to find all cover-images at */_cover_image/original.(jpg|png) and convert them into 100x100
# uses imageMagick

# ~ 2016-11-26 Note ~Future: can generalise this to place images in a 100sq folder, and accept more images than just ones labelled 'original'

# JPG
find . -path "*/_cover_image/original.jpg" -print0 | while IFS= read -r -d '' file; do
  convert -thumbnail 100x100^ "$file" -gravity center -extent 100x100 "${file%.*}-100sq.jpg"
  file "$file" #uncomment for testing
done

# PNG
find . -path "*/_cover_image/original.png" -print0 | while IFS= read -r -d '' file; do
  convert -thumbnail 100x100^ "$file" -gravity center -extent 100x100 "${file%.*}-100sq.jpg"
  file "$file" #uncomment for testing
done