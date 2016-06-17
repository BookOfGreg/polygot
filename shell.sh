function whoson {
  if ! lsof -i:${1}
  then
    echo "Nothing running on :${1}"
  fi
}

function count_lines {
  find ${2} -name ${1} | xargs wc -l
}

alias ll='ls -al'
alias l='ls -al'
alias reload='source ~/.bash_profile'
alias sub='subl'
alias serve='ruby -run -e httpd . -p 9090'
alias dnsflush='sudo killall -HUP mDNSResponder'

alias tar=gtar

PS1='\[\033[0;33m\]$(ruby -v | cut -d " " -f 2)\[\033[0m\]:\W\[\033[0m\]$ '
CLICOLOR=1; export CLICOLOR
LSCOLORS=GxFxCxDxBxegedabagaced; export LSCOLORS
