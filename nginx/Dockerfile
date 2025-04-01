# Use the Node base image as the build stage
FROM nginx:alpine

# Create the SSL directory
RUN mkdir -p /etc/nginx/ssl

# Copy config files
COPY config/*.conf /etc/nginx/conf.d/

# Copy SSL files
COPY ssl/* /etc/nginx/ssl/

# Expose the container port
EXPOSE 443 80