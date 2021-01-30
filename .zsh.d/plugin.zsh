# At first, start "zplug"
source ~/.zplug/init.zsh

# filter setting for "enhancd"
#export ENHANCD_FILTER=peco:fzf
#zplug "b4b4r07/enhancd", use:enhancd.sh

zplug "zsh-users/zsh-completions"

# This is the command for installation.
#zplug "b4b4r07/enhancd", use:init.sh

# At the end, load plugins
zplug load --verbose
