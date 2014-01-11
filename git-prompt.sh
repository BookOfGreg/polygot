if [ -f /usr/share/git-core/git-prompt.sh ]; then
  . /usr/share/git-core/git-prompt.sh
elif [ -f /usr/local/Cellar/git/1.8.4/etc/bash_completion.d/git-prompt.sh ]; then
  . /usr/local/Cellar/git/1.8.4/etc/bash_completion.d/git-prompt.sh
elif [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
  . /usr/local/etc/bash_completion.d/git-prompt.sh
elif [ -f /usr/local/git/contrib/completion/git-prompt.sh ]; then
  . /usr/local/git/contrib/completion/git-prompt.sh
fi
