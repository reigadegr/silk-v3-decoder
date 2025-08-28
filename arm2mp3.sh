#!/bin/sh
set -e
for i in $(dirname "$0")/*amr; do
    # /system/bin/su -c chmod +r $i
    echo $i
    ./decoder $i $i.pcm
    # /data/data/com.termux/files/usr/bin/ffmpeg -y -f s16le -ar 24000 -ac 1 -i $i.pcm -b:a 320k -q:a 0 $i.mp3 &
    yes | /data/data/com.termux/files/usr/bin/ffmpeg -f s16le -ar 24000 -ac 1 -i $i.pcm -c:a flac $i.flac

done
rm *pcm*
