# Setting the PS1 by hooking the pre-load.
_ruby_ps1_load() {
  RUBY_PS1=$(ruby -v | cut -d " " -f 2)
}
_ruby_ps1() {
  RUBY_PS1=$(ruby -v | cut -d " " -f 2)
}
PROMPT_COMMAND="${PROMPT_COMMAND:-:};_ruby_ps1_load"
PS1="\[\e[32m$(_ruby_ps1)"

function find_rb_files {
  if [[ -z "$1" ]]
  then
    LOC='.'
  else
   LOC=$1
  fi

  find "${LOC}" -name '*.rb'
}

eval "$(rbenv init -)"

alias rbs=find_rb_files
alias be="bundle exec"
alias bi="echo 'bundle check & install'; bundle check; bundle install"

function rgem {
  RUBY="
    STDIN.each do |line|
      line.scan(/^(\S+).\((\S+)\)$/).each {|g, v| puts \"gem '#{g}', '~> #{v}'\"}
    end
"
  gem list --remote $1 | ruby -e "$RUBY"
}
