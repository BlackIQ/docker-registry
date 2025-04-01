# Docker Registry with UI and API

This repository sets up a Docker registry with a user interface and API access, using Docker Compose for easy deployment.

## Project Structure

```plaintext
.
├── Makefile
├── docker-compose.yaml
├── jobs
│   ├── run_gc.md
│   └── run_gc.sh
├── nginx
│   ├── Dockerfile
│   ├── config
│   │   └── registry.conf
│   └── ssl
│       ├── fullchain.pem
│       └── privkey.pem
└── scripts
    ├── add.sh
    ├── change.sh
    ├── delete.sh
    └── list.sh
```

## Makefile Targets

- **all**: Builds and starts the Docker containers.
- **build**: Builds the Docker images.
- **up**: Creates and starts the Docker containers.
- **down**: Stops and removes the Docker containers.
- **restart**: Restarts the Docker containers by stopping, building, and starting them again.

## Docker Compose Configuration

The `docker-compose.yaml` file defines three services:

- **registry-api**: The Docker registry API server.
- **registry-client**: A user interface for interacting with the Docker registry.
- **registry-proxy**: An Nginx proxy for handling SSL termination and forwarding requests to the appropriate service.

## Garbage Collection Job

The `jobs/run_gc.sh` script performs garbage collection on the Docker registry to free up space. It checks disk space before and after running the garbage collection. For more information about this job, headover to [here](jobs/run_gc.md).

## User Management Scripts

In the `scripts` directory, there are scripts for managing users in the Docker registry. Users are located in `htpasswd` file located at `/etc/docker-registry/auth/htpasswd`:

- **add.sh**: Adds a new user.
- **change.sh**: Changes the password for an existing user.
- **delete.sh**: Deletes a user.
- **list.sh**: Lists all users.

## Nginx Configuration

The Nginx configuration in `nginx/config/registry.conf` sets up the proxy with SSL termination and forwards requests to the registry API and client.

## SSL Certificates

The SSL certificates are stored in the `nginx/ssl` directory:

- `fullchain.pem`: The full certificate chain.
- `privkey.pem`: The private key.

## Usage

1. **Build and Start Services**: Use `make all` to build the Docker images and start the services.
2. **Stop Services**: Use `make down` to stop and remove the Docker containers.
3. **Restart Services**: Use `make restart` to rebuild and restart the services.

## Notes

- Ensure the SSL certificates are correctly placed in the `nginx/ssl` directory.
- Customize the Nginx configuration and Docker Compose file as needed for your environment.
- Use the scripts in the `scripts` directory to manage users in the Docker registry.