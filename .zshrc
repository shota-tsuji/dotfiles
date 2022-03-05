
# .zshrc
# When you want to reload zsh files, type this command "exec zsh".

ZSH_HOME="${HOME}/.zsh.d/common"
# "-d 'file'" returns true if 'file' is a directory.
# "cond1 -a cond2" returns true if both conditions are ture.
# "-r 'file'" returns true if 'file' is able to be read.
# "-x 'file'" returns true if 'file' is executable one.
if [ -d $ZSH_HOME -a -r $ZSH_HOME -a -x $ZSH_HOME ]; then
	for i in $ZSH_HOME/*; do
		# Show loaded files. (If No need, comment out below one line.)
		#echo $i

		# "${i##*/}" returns matched string from end up to '/'.
		# This is a regular expression.
		# First condition passes only "*.zsh" files in "ZSH_HOME" directory.
		# "-o" is "or" operator.
		# "-h 'file'" returns true if 'file' exists and it is a symbolic link.
		[[ ${i##*/} = *.zsh ]] && [ \( -f $i -o -h $i \) -a -r $i ] && . $i
	done
fi

case ${OSTYPE} in
    darwin*)
        KUSTOMIZE_ZSH_DIR="${HOME}/.zsh.d/mac"
        if [ -d $KUSTOMIZE_ZSH_DIR -a -r $KUSTOMIZE_ZSH_DIR -a -x $KUSTOMIZE_ZSH_DIR ]; then
            for i in $KUSTOMIZE_ZSH_DIR/*; do
                #echo $i
                [[ ${i##*/} = *.zsh ]] && [ \( -f $i -o -h $i \) -a -r $i ] && . $i
            done
        fi
        ;;
    linux*)
        KUSTOMIZE_ZSH_DIR="${HOME}/.zsh.d/linux"
        if [ -d $KUSTOMIZE_ZSH_DIR -a -r $KUSTOMIZE_ZSH_DIR -a -x $KUSTOMIZE_ZSH_DIR ]; then
            for i in $KUSTOMIZE_ZSH_DIR/*; do
                #echo $i
                [[ ${i##*/} = *.zsh ]] && [ \( -f $i -o -h $i \) -a -r $i ] && . $i
            done
        fi
        ;;
esac

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/shota/.sdkman"
[[ -s "/home/shota/.sdkman/bin/sdkman-init.sh" ]] && source "/home/shota/.sdkman/bin/sdkman-init.sh"
