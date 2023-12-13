#!/bin/bash
apt-get update -y
apt-get install -y nginx
sytemctl enable nginx
systemctl start nginx

echo "server {
    listen 80;

    location / {
        proxy-pass http://terraform-static.s3-website.us-east-2.amazonaws.com
    }
}" > /etc/nginx/sites-avaliable/default


