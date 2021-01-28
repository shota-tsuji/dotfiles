
# 環境変数
# export LANG=ja_JP.UTF-8

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
eval "$(pyenv init -)"	#eval "$(pyenv virtualenv-init -)"

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
bindkey -e # This bindkey should come after 'EDITOR=vim'
export PATH="$HOME/bin:$PATH"
export GHQ_ROOT=$HOME/Work/src
export WORK=$HOME/Work
export PLENV_PATH=$WORK/src/github.com/tokuhirom/plenv # plenv binary
export PATH=$PLENV_PATH/bin:$PATH
eval "$(plenv init - zsh)"

export LD_LIBRARY_PATH=${HOME}/local/lib/ # boost libraries etc...

export PATH="/home/shota/Work/src/github.com/rbenv/rbenv/bin:$PATH"
eval "$(rbenv init -)"
