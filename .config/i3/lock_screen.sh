#!/bin/bash

# take screenshot
import -window root /tmp/screenshot.png

# blur it
convert /tmp/screenshot.png -blur 0x5 /tmp/screenshotblur.png
rm /tmp/screenshot.png

# lock the screen
i3lock -i /tmp/screenshotblur.png

sleep 60; pgrep i3lock && xset dpms force off

exit 0
