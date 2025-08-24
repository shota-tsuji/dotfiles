function e () {
  local command
  command="$(commands)"
  echo "${command}"
  eval "${command}"
}
