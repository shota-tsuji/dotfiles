# Enable kubectl completion
if type kubectl &>/dev/null; then
  source <(kubectl completion zsh)
fi

alias k=kubectl
compdef __start_kubectl k

source <(stern --completion=zsh)