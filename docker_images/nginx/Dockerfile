FROM nginx:latest

# Remove default Nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy SSL certificates (replace with your actual paths)
COPY certs/localhost+1.pem /etc/nginx/certs/fullchain.pem
COPY certs/localhost+1-key.pem /etc/nginx/certs/privkey.pem

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy your web app (static files)
COPY webapp/sympli-client-assessment /usr/share/nginx/html

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]