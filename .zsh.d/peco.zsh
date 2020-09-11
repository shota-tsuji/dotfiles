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

