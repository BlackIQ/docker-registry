#!/bin/bash

# Check disk space before garbage collection
echo "Disk space before garbage collection:"
df -h

# Run garbage collection on the Docker registry
docker exec registry-api registry garbage-collect /etc/docker/registry/config.yml

# Check disk space after garbage collection
echo "Disk space after garbage collection:"
df -h
