function _scp_completion() {
  perl -ne 'print "$1 " if /^[Hh]ost (.+)$/' ~/.ssh/config
}
complete -W "$(_scp_completion)" scp
