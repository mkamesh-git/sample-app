# Use an official Nginx image as the base image
FROM nginx:latest

# Copy static website files to Nginx default directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
