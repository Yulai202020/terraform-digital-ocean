#!/bin/bash

apt update
apt install -y nginx
apt install -y git-all

systemctl enable nginx
systemctl start nginx

hostname > /var/www/html/index.html