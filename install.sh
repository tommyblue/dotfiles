#!/bin/bash

if [ $# -ge 1 ] && [ $1 = "-f" ]; then
    echo -e "=> Enabling FORCE MODE (existing dotfiles will be deleted) <="
    FORCE=1
else
    FORCE=0
fi

for dotfile in `ls ./files/`; do
    if [ $FORCE -eq 1 ]; then
        rm $HOME/.$dotfile
    fi

    if [ -e $HOME/.$dotfile ] || [ -L $HOME/.$dotfile ]; then
        echo -e ".$dotfile exists, skipping..."
    else
        echo -e "ln -s `pwd`/files/$dotfile ~/.$dotfile"
        ln -s `pwd`/files/$dotfile $HOME/.$dotfile
    fi
done
