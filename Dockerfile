e an official Nginx image as the base image
FROM nginx:latest

# Copy the static website files into the Nginx web directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 to allow external access
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]

