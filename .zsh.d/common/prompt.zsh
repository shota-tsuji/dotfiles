RPROMPT=""

autoload -Uz vcs_info
autoload -Uz add-zsh-hook
#precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
#zstyle ':vcs_info:git:*' formats '%b'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

PROMPT='%B%F{green}[%n]%f'\$vcs_info_msg_0_'%b%B%#%b '
#PROMPT='%B%{$bg[green]%}[%n]%{$reset_color%}%b%B'\$vcs_info_msg_0_'%b%B%#%b '
PROMPT='%B[%n]'\$vcs_info_msg_0_'%b%B%#%b '
precmd(){ 
    vcs_info
    if [ -n "$TMUX" ]; then
        tmux refresh-client -S
    fi
}
