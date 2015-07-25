#!/bin/bash

/run.sh &

PHPFPMPID=$!

while ! exec 6<>/dev/tcp/127.0.0.1/9000; do
    echo "Waiting for PHP-FPM..."
    sleep 1
done

SCRIPT_NAME=/warm.php \
SCRIPT_FILENAME=/warm.php \
REQUEST_METHOD=GET \
cgi-fcgi -bind -connect 127.0.0.1:9000

kill $PHPFPMPID
