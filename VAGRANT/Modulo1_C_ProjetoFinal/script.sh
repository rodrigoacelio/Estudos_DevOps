#!/bin/bash
echo "Provisionando máquina..."
sudo apt-get update
sudo apt-get install -y python3 python3-pip
pip3 install -r /var/www/html/requirements.txt
