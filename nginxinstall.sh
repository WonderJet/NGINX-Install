#!bin/bash

domain=$1
root="/var/www/example.com/html"
block="/etc/nginx/sites-available/example.com"

#Installs nginx

su root
sudo apt-get update
sudo apt-get install nginx

#Configures nginx

sudo mkdir -p $root
sudo tee $block > /dev/null <<EOF
server {
        listen 3200;
        
        root /var/www/example.com/html;
        index index.html index.htm;
        
        server_name example.com www.example.com;
        
        location ~ \.php {
                    proxy_pass http://127.0.0.1:3400;
        }
}                    




