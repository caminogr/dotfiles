#!/bin/bash

# TODO: .git などに対して シンボリックリンクのループになってしまっている
for file in .??*
do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".config" ] && continue
  ln -Fs $HOME/dotfiles/$file $HOME/$file
done
