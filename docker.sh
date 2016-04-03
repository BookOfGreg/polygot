# status = docker-machine active
# if [ status -ne Running ]; then
# eval $(docker-machine env default)
# fi
alias denv="eval $(docker-machine env default)"