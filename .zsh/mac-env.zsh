[[ -s "/Users/shota-tsuji/.gvm/scripts/gvm" ]] && source "/Users/shota-tsuji/.gvm/scripts/gvm"

[ -s "/Users/shota-tsuji/.jabba/jabba.sh" ] && source "/Users/shota-tsuji/.jabba/jabba.sh"

[ -f $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh ] && source $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export PATH="$GOENV_ROOT/shims:$PATH"
eval "$(goenv init -)"