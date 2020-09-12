
# .zshrc
# When you want to reload zsh files, type this command "exec zsh".

# 環境変数
export LANG=ja_JP.UTF-8
#export PATH=$PATH:/usr/include/c++/4.8/
#export PATH=/usr/local/bin:/usr/bin:$PATH

ZSH_HOME="${HOME}/.zsh.d"
# "-d 'file'" returns true if 'file' is a directory.
# "cond1 -a cond2" returns true if both conditions are ture.
# "-r 'file'" returns true if 'file' is able to be read.
# "-x 'file'" returns true if 'file' is executable one.
if [ -d $ZSH_HOME -a -r $ZSH_HOME -a -x $ZSH_HOME ]; then
	for i in $ZSH_HOME/*; do
		# "${i##*/}" returns matched string from end up to '/'.
		# This is a regular expression.
		# First condition passes only "*.zsh" files in "ZSH_HOME" directory.
		# "-o" is "or" operator.
		# "-h 'file'" returns true if 'file' exists and it is a symbolic link.
		[[ ${i##*/} = *.zsh ]] && [ \( -f $i -o -h $i \) -a -r $i ] && . $i

		# Show loaded files. (If No need, comment out below one line.)
		echo $i
	done
fi

#補完機能======================================================================
autoload -U compinit
compinit

# 補完に関するオプション
setopt auto_param_slash
setopt mark_dirs
setopt list_types
setopt auto_menu
setopt auto_param_keys
# '#' 以降をコメントとして扱う
setopt interactive_comments
# '=' 以降も補完する
setopt magic_equal_subst

setopt complete_in_word
setopt always_last_prompt

# Shift-Tabで補完候補を逆順する
bindkey "^[[Z" reverse-menu-complete

# 日本語ファイル名を表示可能にする
setopt print_eight_bit
setopt extended_glob
setopt globdots
setopt list_packed

# 補完において、小文字入力に対して大文字もマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補を、矢印でも選択できるようにする
zstyle ':completion:*:default' menu select=2

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# 以下で指定した文字は単語区切りとみなされる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

#History設定===================================================================
# ヒストリを保存するファイル
HISTFILE=~/.zsh_history
# メモリに保存されるヒストリの件数
HISTSIZE=1000000
# 保存されるヒストリの件数
SAVEHIST=1000000

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzsh間においてヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

#色付け等の設定=================================================================
# 色の設定(プロンプトに色付けをおこなう)
autoload -U colors ; colors

# Get 'ls' command colorized
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=94:ln=35:so=32:pi=33:ex=92:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ファイル補完候補にも色付けをおこなう
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# beepを無効化
setopt no_beep
# フローコントロールを無効化
setopt no_flow_control
# Ctrl+Dでのzsh終了を無効化
setopt ignore_eof
# ディレクトリ名のみでもcdする
setopt auto_cd
# cdしたら自動的にpushdする
setopt auto_pushd

#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

#export PATH=~/CodeSourcery/Sourcery_G++_Lite/bin:$PATH

# for OpenCV2.4.11
#PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
#export PKG_CONFIG_PATH

# Adding Mar/22/2017
#export HISTTIMEFORMAT='%F %T '
# Add Sep/28/2017
#export PATH="/usr/share/texlive:$PATH"
#export PATH="/usr/share/texlive/texmf-dist:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# haskell environment
#export PATH="/home/shota/.local/bin:$PATH"
#export CXX='g++-7'
#export CC='gcc-7'
#export CMAKE_ROOT='/usr/local/share/cmake-3.11'

#export PATH=$PATH:
#alias GTEST_DIR='~/build/googletest/googletest'
#A shortcut function to compile and run your Google Tests. Usage:
#			$ googletest ./mytest.cpp
#googletest() {
#	myexec='my_googletest'
#	g++ -isystem ~/build/googletest/googletest/include/ -pthread "$@" ~/build/googletest/googletest/libgtest.a -o $myexec
#	./$myexec
#}

#Using the C++11 compiler:
#googletest11() {
#	myexec='my_googletest'
#	g++ -std=c++11 -isystem ~/build/googletest/googletest/include/ -pthread "$@" ~/build/googletest/googletest/libgtest.a -o $myexec
#	./$myexec
#}
#export -f googletest11
#export GTEST_DIR=~/build/googletest/googletest

#export hadoop for using bin/hadoop
#export PATH="/usr/local/hadoop/bin:$PATH"
#export PATH="~/Downloads/script:$PATH"


#export SPARK_HOME=/usr/local/spark
#export PATH=$PATH:$SPARK_HOME/bin

#alias sbt='docker run --tty --interactive --volume $PWD:/app bigtruedata/sbt'
export PATH=$PATH:$(go env GOPATH)/bin
#export GOPATH=$(go env GOPATH)
export GOPATH=$HOME/Work
export PATH=$GOPATH/bin:$PATH
export TODO_DIR="$HOME/.todo"
export EDITOR=vim
export PATH="$HOME/bin:$PATH"
