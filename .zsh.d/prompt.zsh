# "%n" shows username.
# "%m" shows hostname up to first '.'.
PROMPT="[%n@%m] %# "
# Set "RPROMPT" to show nothing.
RPROMPT=""

autoload -Uz vcs_info
#precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
#zstyle ':vcs_info:git:*' formats '%b'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
#MY_PROMPT='[%n@%m]'\$vcs_info_msg_0_'%# '
#PROMPT='[%n@%m:%c]'\$vcs_info_msg_0_'%# '
#
#PROMPT='[%n:%~]'\$vcs_info_msg_0_'%# '
PROMPT='[%~]'\$vcs_info_msg_0_'%# '
#PROMPT='[%(!.%{\e[1;31m%}%n%{\e[0m%}.%{\e[1;31m%}%n%{\e[0m%})%n:%c]'\$vcs_info_msg_0_'%# '
precmd(){ 
    vcs_info
    if [ -n "$TMUX" ]; then
        tmux refresh-client -S
    fi
}

