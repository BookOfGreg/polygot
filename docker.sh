function denv {
  eval $(docker-machine env default)
}

function drun {
  docker-machine start default
}

alias debug="docker-compose run --service-ports"