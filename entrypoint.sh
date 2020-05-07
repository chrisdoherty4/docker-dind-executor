#!/bin/sh

info()
{
    echo "[container] $1"
}

log=/var/log/dockerd-entrypoint.log
info "Launching dockerd, this will take a few seconds ..."
/usr/local/bin/dockerd-entrypoint.sh &> $log &

# Timeout is calculated by sleep/timeout_in_seconds. 5 / .2 = 25
sleep=.2
timeout=25
elapsed=0

docker images &> /dev/null
until [ $? -eq 0 ] | [ $elapsed -ge $timeout ]
do
    elapsed=$(( $elapsed + 1 ))
    sleep $sleep
    docker images &> /dev/null
done

docker images &> /dev/null
if [ $? -ne 0 ]
then
    cat $log
    info "Starting dockerd timed out"
    exit 1
fi
    
info "dockerd now running."

exec "$@"
