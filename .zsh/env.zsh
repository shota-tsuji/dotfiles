export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"	#eval "$(pyenv virtualenv-init -)"#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"	#eval "$(pyenv virtualenv-init -)"

#export PATH=$PATH:$(go env GOPATH)/bin
#export GOPATH=$HOME/go
#export PATH=$GOPATH/bin:$PATH
export EDITOR=vim

bindkey -v
export PATH="$HOME/bin:$PATH"
export WORK=$HOME/Work

#export PATH="/home/shota/Work/src/github.com/rbenv/rbenv/bin:$PATH"
#eval "$(rbenv init -)"

# forgit
export FORGIT_FZF_DEFAULT_OPTS='
--preview-window=down
--bind="ctrl-f:preview-page-down,ctrl-b:preview-page-up"
'

# For Poetry, etc.
export PATH="$HOME/.local/bin:$PATH"
