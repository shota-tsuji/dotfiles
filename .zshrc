# if .zsh is a directory && readable && executable
ZSH_DIR="${HOME}/.zsh"
if [ -d $ZSH_DIR ] && [ -r $ZSH_DIR ] && [ -x $ZSH_DIR ]; then
    # loop for all <script>.zsh files under the .zsh directory
    for file in ${ZSH_DIR}/**/*.zsh; do
        # if readable
        [ -r $file ] && source $file
    done
fi

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
