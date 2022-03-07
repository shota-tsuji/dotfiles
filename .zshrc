#========================================
# .zshrc
#
# When you want to reload zsh files, type
# this command "exec zsh".
#========================================

# usage: load-zsh-scripts directory
function load-zsh-scripts() {
    local SCRIPT_DIR=$1
    # "-d 'file'" returns true if 'file' is a directory.
    # "cond1 -a cond2" returns true if both conditions are ture.
    # "-r 'file'" returns true if 'file' is able to be read.
    # "-x 'file'" returns true if 'file' is executable one.
    if [ -d $SCRIPT_DIR -a -r $SCRIPT_DIR -a -x $SCRIPT_DIR ]; then
        for i in $SCRIPT_DIR/*; do
            # Show loaded files. (If No need, comment out below one line.)
            echo $i

            # "${i##*/}" returns matched string from end up to '/'.
            # This is a regular expression.
            # First condition passes only "*.zsh" files in "ZSH_HOME" directory.
            # "-o" is "or" operator.
            # "-h 'file'" returns true if 'file' exists and it is a symbolic link.
            [[ ${i##*/} = *.zsh ]] && [ \( -f $i -o -h $i \) -a -r $i ] && . $i
        done
    fi
}


ZSH_HOME="${HOME}/.zsh.d/common"
load-zsh-scripts ${ZSH_HOME}
load-zsh-scripts ${HOME}/.zsh.d/company

case ${OSTYPE} in
    darwin*)
        KUSTOMIZE_ZSH_DIR="${HOME}/.zsh.d/mac"
        load-zsh-scripts ${KUSTOMIZE_ZSH_DIR}
        ;;
    linux*)
        KUSTOMIZE_ZSH_DIR="${HOME}/.zsh.d/linux"
        load-zsh-scripts ${KUSTOMIZE_ZSH_DIR}
        ;;
esac

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
export JAVA_HOME=${SDKMAN_DIR}/candidates/java/current
export PATH=${JAVA_HOME}/bin:$PATH
export SDKMAN_INIT_SCRIPT="${SDKMAN_DIR}/bin/sdkman-init.sh"
[[ -s ${SDKMAN_INIT_SCRIPT} ]] && source ${SDKMAN_INIT_SCRIPT}
