#===================================================================
# Alias
#
# If you want to display alias list, type 'alias' on the terminal.
#===================================================================

alias h='history'
alias j='jobs -l'

# Set vim as default
alias vi=vim
alias svi='sudo vim'
alias edit='vim'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

# sudoの後ろのコマンドでのエイリアスを有効化
alias sudo='sudo '

alias p='pwd'
alias out='logout'
alias tm='tmux'
alias t='tig --all'
alias gs='git status -s'
alias gsw='git switch -'
alias g='git'
alias gc='git-cz'
alias gl='git log main..HEAD --oneline'
alias glm='git log master..HEAD --oneline'
alias gr='git gr'
alias git-log='git log'
alias git-rebase='git rebase -i HEAD~8'
alias d='git diff'
alias d-head='git diff HEAD'
alias d-main='git diff main'
alias d-master='git diff master'
alias ag-hidden='ag --hidden'
alias ag-file='ag --files-with-matches'
