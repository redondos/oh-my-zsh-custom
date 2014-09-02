if [[ $(uname -s) == "Darwin" ]]; then
  export DOCKER_HOST=tcp://localhost:4243
  export DOCKER_HOST=tcp://192.168.59.103:2375
fi

