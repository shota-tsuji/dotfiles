# If you want to display alias list, type 'alias' on the terminal.

# Command short cuts to save time
alias h='history'
alias j='jobs -l'
alias ff='firefox &'
# Create a new set of commands
alias path='echo -e ${PATH//:\\n}'
alias now='date +"%d-%m-%Y	%T"'

# Set vim as default
alias vi=vim
alias svi='sudo vim'
alias edit='vim'

#========================================
# Alias
#========================================
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

#alias g++='g++ -std=c++11'
#alias clang++='clang++ -std=c++11'
alias platex='platex -shell-escape'

# sudoの後ろのコマンドでのエイリアスを有効化
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G="| grep"
# Adding June/14/2017
alias grep='grep --color=auto'

# battery state check
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'
alias b='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'

#alias pd='popd'
#alias p='popd'
alias p='pwd'
alias hg='history | grep'
alias untar='tar xvf'
alias unztar='tar xzvf'
alias E='exit'
alias S='source'
alias evi='evince'
alias D='display'
#alias latexmk='latexmk -pv'
alias lmk='latexmk -pvc'
alias lmkc='latexmk -c'
alias F='fg'
# 
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
#alias l.='ls -d .* --color=auto'
alias ..='cd ..'
alias ...='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
## Command short cuts to save time
#alias h='history'
#alias j='jobs -l'
#alias ff='firefox &'
## Create a new set of commands
#alias path='echo -e ${PATH//:\\n}'
#alias now='date +"%d-%m-%Y	%T"'
## Set vim as default
#alias vi=vim
#alias svi='sudo vim'
#alias edit='vim'

# LaTeX command using docker texlive container for Japanese
alias docker-latex='docker run --rm -it -v $PWD:/workdir paperist/alpine-texlive-ja'
#alias c='clear'
alias out='logout'
alias tm='tmux'
alias t='tig --all'
alias g='git status -s'
alias gc='git commit'
alias gl='git log'
alias git-log='git log'
alias d='git diff'

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias j='journalctl'
