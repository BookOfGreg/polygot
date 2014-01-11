if [ -f /usr/share/git-core/git-completion.bash ]; then
  . /usr/share/git-core/git-completion.bash
elif [ -f /usr/local/Cellar/git/1.8.4/etc/bash_completion.d/git-completion.bash ]; then
  . /usr/local/Cellar/git/1.8.4/etc/bash_completion.d/git-completion.bash
elif [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/git-completion.bash
elif [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi
