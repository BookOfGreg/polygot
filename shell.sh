alias ll='ls -ltr | tail'
alias l='ls -1tr | tail'
alias fndr='open /System/Library/CoreServices/Finder.app "$PWD"'

alias sub='subl'

PS1='\[\033[0;33m\]$(rvm current)\[\033[0m\]:$(basename $PWD) \[\033[0m\]$ '
CLICOLOR=1; export CLICOLOR
LSCOLORS=GxFxCxDxBxegedabagaced; export LSCOLORS
