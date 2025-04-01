#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <username> <new_password>"
    exit 1
fi

USERNAME=$1
NEW_PASSWORD=$2

if ! grep -q "^$USERNAME:" /volumes/registry/auth/htpasswd; then
    echo "User $USERNAME does not exist."
    exit 1
fi

sed -i "/^$USERNAME:/d" /volumes/registry/auth/htpasswd

docker run --rm --entrypoint htpasswd httpd:2 -Bbn "$USERNAME" "$NEW_PASSWORD" >> /volumes/registry/auth/htpasswd

echo "Password for user $USERNAME has been changed."
