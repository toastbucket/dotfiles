#!/bin/bash

# lock the screen
swaylock

sleep 60; pgrep swaylock && xset dpms force off

exit 0
