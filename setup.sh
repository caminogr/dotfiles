#!/bin/bash

for file in .??*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.config' ]
    then
        ln -snfv "$PWD/$dotfile" $HOME
    elif [ $dotfile == '.config' ]; then
        ln -snfv "$PWD/.config/nvim" "$HOME/.config/"
    fi
done
