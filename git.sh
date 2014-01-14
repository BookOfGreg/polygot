function git_branch_date {
  git branch -vv --color=always | while read; do
    # The underscore is because the active branch is preceded by a '*', and
    # for awk I need the columns to line up. The perl call is to strip out
    # ansi colors; if you don't pass --color=always above you can skip this
    local branch=$(echo "_$REPLY" | awk '{print $2}' | perl -pe 's/\e\[?.*?[\@-~]//g')
    # git log fails when you pass a detached head as a branch name.
    # Hide the error and get the date of the current head.
    local branch_modified=$(git log -1 --format=%ci "$branch" 2> /dev/null || git log -1 --format=%ci)
    echo -e "$branch_modified $REPLY"
    # cut strips the time and timezone columns, leaving only the date
    done | sort -r | cut -d ' ' -f -1,4-
}

alias gc='git commit -m'
alias gca='git commit -am'
alias ga='git add'
alias gs='git status -sbuall'
alias glo='git log --oneline'
alias gl="git log --graph --pretty=\"format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset\""
alias gds='git diff --staged'
alias gd="git diff"
alias gb="git branch -a"
alias gbs=git_branch_date

git config --global color.ui true
git config --global alias.co checkout

export GIT_PS1_SHOWDIRTYSTATE=true

. ~/.poly/git-prompt.sh
PS1='\[\033[32m\]$(rvm current)\[\033[00m\]:\[\033[34m\]$(basename $PWD)\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
