#!/bin/bash

for dotfile in `ls ./files/`; do
    if [ -e $HOME/.$dotfile ] || [ -L $HOME/.$dotfile ]; then
        echo -e ".$dotfile exists, skipping..."
    else
        echo -e "ln -s ./$dotfile ~/.$dotfile"
        ln -s ./$dotfile $HOME/.$dotfile
    fi
done
