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

function rit {
  type $1 &>/dev/null && $1
}

alias ll='ls -al'
alias l='ls -al'
alias reload='source ~/.bash_profile'
alias sub='subl'
alias serve='ruby -run -e httpd . -p 9090'
alias dnsflush='sudo killall -HUP mDNSResponder'
alias tlscheck=sslcheck

alias tar=gtar

PS1="\[\033[32m\]"'$(rit _ruby_ps1),$(rit _node_ps1),$(rit kube_ps1)'"\[\033[00m\]:\[\033[34m\]\W\[\033[31m\]"'$(__git_ps1)'"\[\033[00m\]\$ "

CLICOLOR=1; export CLICOLOR
LSCOLORS=GxFxCxDxBxegedabagaced; export LSCOLORS
