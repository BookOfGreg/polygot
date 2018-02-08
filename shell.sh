function sslcheck {
  echo "Q" | openssl s_client -showcerts -connect ${1}:443
}

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
alias tlscheck=sslcheck

alias tar=gtar

PS1="\[\e[32m$(_ruby_ps1),${NODE_PS1},$(kube_ps1)\[\e[00m:\[\e[34m\W\[\e[31m${GIT_PS1}\[\e[00m\$ "

CLICOLOR=1; export CLICOLOR
LSCOLORS=GxFxCxDxBxegedabagaced; export LSCOLORS
