# Use the Nginx base image
FROM nginx:alpine

# Copy your HTML files into the Nginx server directory
COPY . /usr/share/nginx/html
