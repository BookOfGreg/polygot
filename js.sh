
PS1="\[\033[32m\]"'$(ruby -v | cut -d " " -f 2),$(node -v)'"\[\033[00m\]:\[\033[34m\]\W\[\033[31m\]"'$(__git_ps1)'"\[\033[00m\]\$ "