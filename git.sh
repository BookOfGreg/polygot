alias gc='git commit -m'
alias ga='git add'
alias gs='git status -sbuall'
alias glo='git log --oneline'
alias gl="git log --graph --pretty=\"format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset\""
alias gd="git diff"

git config --global alias.co checkout

# Set git autocompletion and PS1 integration
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi
export GIT_PS1_SHOWDIRTYSTATE=true

PS1='\[\033[32m\]$(rvm current)\[\033[00m\]:\[\033[34m\]$(basename $PWD)\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
