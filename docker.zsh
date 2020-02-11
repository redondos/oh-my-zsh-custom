if [[ $(uname -s) == "Darwin" ]]; then
  # boot2docker - deprecated
   # export DOCKER_HOST=tcp://localhost:4243
   # export DOCKER_HOST=tcp://192.168.59.103:2376
   # export DOCKER_CERT_PATH=/Users/redondos/.boot2docker/certs/boot2docker-vm
   # export DOCKER_TLS_VERIFY=1

   # docker-machine
   # eval $(docker-machine env docker-1)
   #export DOCKER_TLS_VERIFY="1"
   #export DOCKER_HOST="tcp://192.168.99.100:2376"
   #export DOCKER_CERT_PATH="/Users/redondos/.docker/machine/machines/docker-1"
   #export DOCKER_MACHINE_NAME="docker-1"

fi

