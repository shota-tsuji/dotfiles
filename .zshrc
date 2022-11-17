# if .zsh is a directory && readable && executable
ZSH_DIR="${HOME}/.zsh"

source $ZSH_DIR/alias.zsh
source $ZSH_DIR/env.zsh
source $ZSH_DIR/options.zsh
source $ZSH_DIR/plugin.zsh
source $ZSH_DIR/style.zsh

source $ZSH_DIR/mac-alias.zsh
#source $ZSH_DIR/linux-alias.zsh
#source $ZSH_DIR/linux-completion.zsh

# To overwrite key-bind, load bindkey options at last.
source $ZSH_DIR/bindkey.zsh
source $ZSH_DIR/peco.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
export JAVA_HOME=${SDKMAN_DIR}/candidates/java/current
export PATH=${JAVA_HOME}/bin:$PATH
export SDKMAN_INIT_SCRIPT="${SDKMAN_DIR}/bin/sdkman-init.sh"
[[ -s ${SDKMAN_INIT_SCRIPT} ]] && source ${SDKMAN_INIT_SCRIPT}
[ -s "/Users/shota-tsuji/.jabba/jabba.sh" ] && source "/Users/shota-tsuji/.jabba/jabba.sh"

[[ -s "/Users/shota-tsuji/.gvm/scripts/gvm" ]] && source "/Users/shota-tsuji/.gvm/scripts/gvm"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
