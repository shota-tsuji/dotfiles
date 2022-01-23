#!/bin/bash

DOT_FILES=(.zshrc .vimrc .tmux.conf .gitconfig .gitignore_global)
for file in ${DOT_FILES[@]}
do
	dst_file=$HOME/$file
	if [ -L $dst_file ]; then
        echo "unlink: $dst_file"
        unlink $dst_file
    else
        echo "symbolic link:" $dst_file "does not exists."
    fi
done

peco_home=$HOME/.peco
peco_config=.peco/config.json
dst_peco_config=$HOME/$peco_config
if [ -d $peco_home -a -L $dst_peco_config ]; then
    echo "unlink: $dst_peco_config"
    unlink $dst_peco_config
else
    echo "symbolic link:" $dst_peco_config "does not exists."
fi

dirs=(.zsh.d .vim/vim-config)
for dir in ${dirs[@]}
do
	dst_dir=$HOME/$dir
	if [ -L $dst_dir ]; then
        echo "unlink: $dst_dir"
        unlink $dst_dir
	else
        echo "symbolic link:" $dst_dir "does not exists."
    fi
done
