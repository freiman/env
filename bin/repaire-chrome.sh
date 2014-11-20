#!/bin/bash

killall -q -9 chrome

if [ -e ~/.config/google-chrome ]; then

	mv ~/.config/google-chrome ~/.config/google-chrome-backup

fi
