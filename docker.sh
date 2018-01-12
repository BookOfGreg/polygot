function denv {
  eval $(docker-machine env default)
}

function drun {
  docker-machine start default
}

function dush {
  docker tag ${1}:latest localhost:5000/${1}:latest
  docker push localhost:5000/${1}:latest
}

if [ -f ~/source/kube-ps1/kube-ps1.sh ]; then
  . ~/source/kube-ps1/kube-ps1.sh
fi

alias debug="docker-compose run --service-ports"
