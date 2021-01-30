function work { cd ~/Work; }
function repo {
	local path=$(ghq list --full-path | peco --query "$LBUFFER")
	if [ -n "$path" ]; then
		if [ -t 1 ]; then
			cd ${path}
			echo 'jump to' ${path}
		fi
	fi
}

# peco find directory
function peco-find() {
	local current_buffer=$BUFFER
	local search_root=""
	local file_path=""

	if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
		search_root=`git rev-parse --show-cdup` # リポジトリへの相対的な位置を出力する
	else
		search_root=`pwd`
	fi
	file_path="$(find ${search_root} -maxdepth 4 -name "*" -not -path '*/.git*' | peco)"
	BUFFER="${current_buffer} ${file_path}"
	CURSOR=$#BUFFER
	#zle clear-screen
}
zle -N peco-find

# bind keys
bindkey '^x^f' peco-find

function peco-history-selection() {
# BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
# BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); }')
	BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
	CURSOR=${#BUFFER}
	zle reset-prompt
}

zle -N peco-history-selection
bindkey '^r' peco-history-selection

# cdr
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
	autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
	add-zsh-hook chpwd chpwd_recent_dirs
	zstyle ':completion:*' recent-dirs-insert both
	zstyle ':chpwd:*' recent-dirs-default true
	zstyle ':chpwd:*' recent-dirs-max 1000
	zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi

function peco-cdr () {
	local selected_dir="$(cdr -l | sed 's/^[0-9]\+ \+//' | peco --prompt="cdr >" --query "$LBUFFER")"
	if [ -n "$selected_dir" ]; then
		BUFFER="cd ${selected_dir}"
		zle accept-line
	fi
}
zle -N peco-cdr
bindkey '^O' peco-cdr

function pdf () {
	local pdf_dir="$HOME/Documents/Books/"
	#ls ${pdf_dir}
	#local selected_pdf="$(ls ${pdf_dir} | xargs readlink -f | peco --prompt="pdf >")"
	local selected_pdf="$(cd $pdf_dir && ls ${pdf_dir} | xargs readlink -f | peco --prompt="pdf >")"
	if [ -n "$selected_pdf" ]; then
		if [ -t 1 ]; then
			evince ${selected_pdf}&
		fi
	fi
}

function peco-vim-open-recent-file () {
	local selected_file="$(egrep '^>' ~/.viminfo | cut -c3- | perl -E 'say for map { chomp; $_ =~ s/^~/$ENV{HOME}/e; -f $_ ? $_ : () } <STDIN>' | peco)"
	if [ -n "$selected_file" ]; then
		BUFFER="vim ${selected_file}" 
	fi
}
zle -N peco-vim-open-recent-file
bindkey '^V' peco-vim-open-recent-file

function peco-git-checkout {
	#local selected_branch="$(git branch | peco | sed 's/^[ \t]*//')"
	local selected_branch="$(git branch | sed 's/^[ \t]*//' | grep -v '^[*]' | peco --prompt="branch >")"
	#echo ${selected_branch}
	#print -z "git checkout ${selected_branch}"
	git checkout ${selected_branch} > /dev/null 2>&1
	echo "Switched to branch '${selected_branch}'"
	#print -z "git checkout $(sed 's/^[ \t]*//' selected_branch)"
	#git branch | peco | xargs git checkout
	#echo ${selected_branch}
	#git checkout ${selected_branch}
	#
	#zle accept-line
	#BUFFER="git checkout ${selected_branch}"
}
alias chch=peco-git-checkout

function peco-forward-change-directory {
    #local selected_dir="$(find ./ -maxdepth 5 -type d | grep -v git | grep -v "許可がありません" | peco)"
    local selected_dir="$(find ./ -maxdepth 5 -type d 2>/dev/null | grep -v git | peco)"
    
    #find ./ -maxdepth 5 -type d | grep -v git | grep -v "許可がありません" | peco
	if [ -n "$selected_dir" ]; then
		BUFFER="cd ${selected_dir}"
		zle accept-line
	fi
}
zle -N peco-forward-change-directory
alias c=peco-forward-change-directory

function make-history-directory () {
    if [ $# != 1 ]; then
        echo "Just one directory name is needed." 1>&2
        return 1
    fi
    mkdir $(date "+%Y-%m-%d-"$1)
}
alias mkhis=make-history-directory
alias mkh=make-history-directory

export HISTORY_BASE_DIRECTORY="$HOME/Work/history/"

function change-directory-to-selected-history () {
	#local path=$(ghq list --full-path | peco --query "$LBUFFER")
    local selected_path="$(cd $HISTORY_BASE_DIRECTORY && ls $HISTORY_BASE_DIRECTORY | xargs readlink -f | peco --prompt="pdf >")"

	if [ -n "$selected_path" -a -d "$selected_path" ]; then
		#if [ -t 1 ]; then
        #    echo ${selected_path}
		#	cd ${selected_path}
		#	echo 'jump to' ${selected_path}
		#fi
		cd ${selected_path}
		echo 'jump to' ${selected_path}
    else
        echo ${selected_path}
        echo "No such history directory."
	fi
}
