function e () {
  local command
  command="$(commands open-repository)"
  echo "${command}"
  eval "${command}"
}
