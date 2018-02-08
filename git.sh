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

function git_rm_branch {
  git branch -D $1
}

function git_rm_all_gone_branches {
  git branch -vv --color=always | grep ': gone]' | cut -d ' ' -f 2-3 | while read branch; do
    local gone_branch=$branch
    git branch -D $gone_branch
  done && git_branch_date
}

function git_branch_set_upstream {
  local branch=$(git branch | grep '*' | cut -d ' ' -f 2)
  git branch --set-upstream-to=origin/$branch $branch
}

function count() {
  git ls-tree -r --name-only $COMMIT | grep -e $1 | wc -l | sed 's/ //g'
}

function git_count_files {
  git log --pretty="%H %cd" --date=short | while read COMMIT DATE
  do
      # skip commits made on the same day
      [ "$PREV_DATE" == "$DATE" ] && continue
      PREV_DATE="$DATE"

      # count files
      MODELS=$(count "app/models/.*\.rb$")
      CONTROLLERS=$(count "app/controllers/.*_controller\.rb$")

      # print to console
      echo $DATE
      echo " $MODELS    models"
      echo " $CONTROLLERS    CONTROLLERS"

      # append to CSV file
      echo "$DATE,$MODELS,$CONTROLLERS" >> $1
  done
}

alias gc='git commit -m'
# alias gca='git commit -am'
alias ga='git add'
alias gs='git status -sbuall'
alias glo='git log --oneline --decorate'
alias gl="git log --graph --pretty=\"format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset\""
alias gds='git diff --staged'
alias gd="git diff"
alias gb="git branch -a"
alias gbs=git_branch_date
alias ghist="gl --all"
alias gbup=git_branch_set_upstream
alias gbrm=git_rm_branch
alias gbrmgone=git_rm_all_gone_branches

# For ZSH compatibility
alias gst=gs

git config --global color.ui true
git config --global color.diff.meta "white bold"
git config --global alias.co checkout
git config --global push.default current

export GIT_PS1_SHOWDIRTYSTATE=true

. ~/.poly/git-prompt.sh
_git_ps1() {
  GIT_PS1=$(__git_ps1)
}
PROMPT_COMMAND="${PROMPT_COMMAND:-:};_git_ps1"