#!/bin/bash

### Install requiremets

apt update
apt install -y git-all

apt install -y python3
apt install -y python3-pip

pip3 install uvicorn

### Export Vars

export service_name="yulai_api"
export project_name="simple_project_fastapi"
export git_project_link="https://github.com/Yulai202020/$project_name.git"

### Copy Project

cd /opt
git clone $git_project_link

cd $project_name
pip install -r requirement.txt

### Create Service

sudo adduser --system --no-create-home ngm
sudo cp $service_name.service /etc/systemd/system/

### Start Service

sudo systemctl daemon-reload
sudo systemctl enable $service_name.service
sudo systemctl start $service_name.service

## Install Nginx

sudo apt -y install nginx
systemctl enable nginx
systemctl start nginx

# ### Start Nginx

sudo cp $service_name.conf /etc/nginx/sites-available/
sudo ln -sf /etc/nginx/sites-available/$service_name.conf /etc/nginx/sites-enabled/$service_name.conf
sudo systemctl restart nginx