function whoson {
  if ! lsof -i:${1}
  then
    echo "Nothing running on :${1}"
  fi
}

alias ll='ls -al'
alias l='ls -al'
alias reload='source ~/.bash_profile'
alias sub='subl'
alias serve='ruby -run -e httpd . -p 9090'
alias dnsflush='sudo killall -HUP mDNSResponder'

PS1='\[\033[0;33m\]$(ruby -v | cut -d " " -f 2)\[\033[0m\]:\W\[\033[0m\]$ '
CLICOLOR=1; export CLICOLOR
LSCOLORS=GxFxCxDxBxegedabagaced; export LSCOLORS
