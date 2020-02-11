export DRONE_SERVER=$(/usr/bin/security -q find-internet-password -g -w -s drone-url -a redondos)
export DRONE_TOKEN=$(/usr/bin/security -q find-internet-password -g -w -s drone -a redondos)
