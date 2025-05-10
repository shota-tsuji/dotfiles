function e () {
  local jetbrains_scripts="$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
  editor=$(ls "$jetbrains_scripts" | fzf --height=40% --reverse --prompt="Select JetBrains Editor: ")
  [ -z "$editor" ] && echo "No editor selected." && return 0

  local repo
  ghq_root=$(ghq root)
  relative_path=$(ghq list --full-path | sed "s|^$ghq_root/||" | fzf --height=40% --reverse --prompt="Select Repository: ")
  [ -z "$relative_path" ] && echo "No repository selected." && return 0

  repo="$ghq_root/$relative_path"
  local command="${editor} ${repo}"
  echo "${command}"
  eval "${command}"
}
