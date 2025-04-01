#!/bin/bash

if [ ! -f /etc/docker-registry/auth/htpasswd ]; then
    echo "htpasswd file not found!"
    exit 1
fi

echo "Users in auth/htpasswd:"
cut -d: -f1 /etc/docker-registry/auth/htpasswd
