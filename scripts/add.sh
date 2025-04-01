#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <username> <password>"
    exit 1
fi

USERNAME=$1
PASSWORD=$2

docker run --rm --entrypoint htpasswd httpd:2 -Bbn "$USERNAME" "$PASSWORD" >> /etc/docker-registry/auth/htpasswd

echo "User $USERNAME added to auth/htpasswd"
