# On the remote machine, execute 'tmux' with 'ssh'.
function ssh-tmux() {
	# Execute with a remote hostname.
	# '-n' is comparision operator.
	# This returns true if an argument string "$1" is not empty.
	if [ -n "$1" ]; then
		ssh -t $* "tmux -2u attach -d || tmux -2u"
	else
		echo "$0 : missing hostname"
		return 1
	fi
}

# Set complement for 'ssh-tmux' command as 'ssh'.
compdef ssh-tmux=ssh

# Using 'ssh' instead of 'ssh-tmux', list up sessions existing
# already.
tmux has-session >/dev/null 2>&1 && if [ -z "${TMUX}" ]; then
	echo '% tmux list-sessions'
	tmux list-sessions
	echo '% tmux list-windows -a'
	tmux list-windows
fi
