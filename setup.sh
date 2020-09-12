#!/bin/bash

DOT_FILES=(.zshrc .vimrc .tmux.conf .gitconfig .gitignore_global)
for file in ${DOT_FILES[@]}
do
	dst_file=$HOME/$file
	if [ -L $dst_file ]; then
		echo "skip: " $dst_file "exists already."
	else
		echo "set : " $file:
		ln -s $(readlink -f $file) $HOME/$file
	fi
done

DIRS=(.zsh.d)
for dir in ${DIRS[@]}
do
	dst_dir=$HOME/$dir
	if [ -L $dst_dir ]; then
		echo "skip: " $dst_dir "exists already."
	else
		echo "set : " $dst_dir
		ln -s $(readlink -f $dir) $dst_dir
	fi
done

# init
PECO_HOME=$HOME/.peco
if [ ! -d $PECO_HOME ]; then
	mkdir $PECO_HOME
fi

PECO_CONFIG=.peco/config.json
dst_peco_config=$HOME/$PECO_CONFIG
if [ -L $dst_peco_config ]; then
	echo "skip: " $dst_peco_config "exists already."
else
	echo $HOME/$PECO_CONFIG
	ln -s $(readlink -f $PECO_CONFIG) $HOME/$PECO_CONFIG
fi
