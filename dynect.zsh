export DYNECT_CUSTOMER=tengen
export DYNECT_USERNAME=redondos
export DYNECT_PASSWORD=$(/usr/bin/security -q find-internet-password -g -w -s dynect.net -a redondos)
