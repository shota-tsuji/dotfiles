export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"	#eval "$(pyenv virtualenv-init -)"

export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export EDITOR=vim

bindkey -v
export PATH="$HOME/bin:$PATH"
export WORK=$HOME/Work

export LD_LIBRARY_PATH=${HOME}/local/lib/ # boost libraries etc...

export PATH="/home/shota/Work/src/github.com/rbenv/rbenv/bin:$PATH"
eval "$(rbenv init -)"

eval "$(starship init zsh)"
