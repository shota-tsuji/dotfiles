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
	zle clear-screen
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
bindkey '^E' peco-cdr
