alias gc='git commit -m'
alias gca='git commit -am'
alias ga='git add'
alias gs='git status -sbuall'
alias glo='git log --oneline'
alias gl="git log --graph --pretty=\"format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset\""
alias gds='git diff --staged'
alias gd="git diff"

git config --global alias.co checkout

export GIT_PS1_SHOWDIRTYSTATE=true

PS1='\[\033[32m\]$(rvm current)\[\033[00m\]:\[\033[34m\]$(basename $PWD)\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
