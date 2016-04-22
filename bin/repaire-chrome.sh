#!/bin/bash

while true; do
    read -p "Do you wish to killall chrome? y/n " yn
    case $yn in
        [Yy]* ) killall -q -9 chrome; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true; do
    read -p "Do you wish to move google-chrome dir from ~/.config/google-chrome to ~/.config/google-chrome-backup? y/n " yn
    case $yn in
        [Yy]* ) [ -e ~/.config/google-chrome ] && rm -rf ~/.config/google-chrome-backup && mv ~/.config/google-chrome ~/.config/google-chrome-backup; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true; do
    read -p "Do you wish to move gnome-keyring dir from ~/.gnome2/keyrings to ~/.gnome2/keyrings-backup? y/n " yn
    case $yn in
        [Yy]* ) [ -e ~/.gnome2/keyrings ] && rm -rf ~/.gnome2/keyrings-backup && mv ~/.gnome2/keyrings ~/.gnome2/keyrings-backup; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
