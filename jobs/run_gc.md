# Garbage Collection for Docker Registry

This document provides instructions for setting up and running a garbage collection script for a Docker registry. The script will clean up unused image layers to free up disk space. It includes steps for running the script manually and setting up a cron job for automated execution.

## Script

The `run_gc.sh` script performs the following tasks:

1. Displays disk space usage before garbage collection.
2. Runs garbage collection on the Docker registry.
3. Displays disk space usage after garbage collection.

## Cron

To automate the garbage collection process, you can set up a cron job to run the run_gc.sh script at a regular interval.

This the cron job to schedule the script to run every day at midnight.

```bash
0 0 * * * /apps/registry/job/run_gc.sh
```
