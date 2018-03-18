#!/bin/bash

function disconnect
{
    exec 99<&-
    exec 99>&-

    exit 1
}

trap disconnect SIGINT

stty -F /dev/ttyUSB0 speed 115200 ignbrk -brkint -icrnl -imaxbel -opost -onlcr -isig -icanon -iexten -echo -echoe -echok -echoctl -echoke 2>&1 > /dev/null
exec 99<>/dev/ttyUSB0

while true; do
    read temp <&99;

    echo -n $(date +"%Y-%m-%d %H:%M:%S.%N ")
    echo "_"$temp
done
