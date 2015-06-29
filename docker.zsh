if [[ $(uname -s) == "Darwin" ]]; then
    export DOCKER_HOST=tcp://localhost:4243
    export DOCKER_HOST=tcp://192.168.59.103:2376
    export DOCKER_CERT_PATH=/Users/redondos/.boot2docker/certs/boot2docker-vm
    export DOCKER_TLS_VERIFY=1
fi

