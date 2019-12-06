#!/bin/bash

DOT_FILES=(.zshrc .vimrc .tmux.conf .gitconfig .gitignore_global)
for file in ${DOT_FILES[@]}
do
	echo $file:
	ln -s $HOME/dotfiles/$file $HOME/$file
done

DIRS=(.zsh.d)
for dir in ${DIRS[@]}
do
	echo $dir:
	ln -s $HOME/dotfiles/$dir $HOME/$dir
done
