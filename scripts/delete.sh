#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

USERNAME=$1

if [ ! -f /volumes/registry/auth/htpasswd ]; then
    echo "htpasswd file not found!"
    exit 1
fi

if ! grep -q "^$USERNAME:" /volumes/registry/auth/htpasswd; then
    echo "User $USERNAME does not exist."
    exit 1
fi

sed -i "/^$USERNAME:/d" /volumes/registry/auth/htpasswd

echo "User $USERNAME deleted from auth/htpasswd"
