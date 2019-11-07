#!/bin/bash

for dotfile in .??*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.config' ]
    then
        ln -snfv "$PWD/$dotfile" $HOME
    elif [ $dotfile == '.config' ]; then
        ln -snfv "$PWD/.config/nvim" "$HOME/.config"
        ln -snfv "$PWD/.config/efm-langserver" "$HOME/.config"
    fi
done
