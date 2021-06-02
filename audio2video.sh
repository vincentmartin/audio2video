#!/bin/sh
mkdir output
for f in *.wma; do
    echo "processing $f"
    #ffmpeg -loop 1 -framerate 1 -i ./song_background.png -i "$f" -c:v libx264 -preset veryslow -crf 0 -c:a copy -shortest output/"$f.mkv"
    convert -pointsize 60 label:"$f" -gravity center -extent 1920x1080 png:-  | ffmpeg -y -f image2pipe -i - -i "$f" -filter_complex "loop=-1:1:0" -shortest output/"$f.mp4"
done
