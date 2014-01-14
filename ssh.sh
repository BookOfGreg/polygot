function _ssh_completion() {
  perl -ne 'print "$1 " if /^[Hh]ost (.+)$/' ~/.ssh/config
}
complete -W "$(_ssh_completion)" ssh
