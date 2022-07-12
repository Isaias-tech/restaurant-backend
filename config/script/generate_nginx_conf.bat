#!/bin/bash

cd /etc/nginx/sites-available

docker inspect restaurant_backend | grep IPAddress > ip-obj.txt

IP=$(grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' ip-obj.txt | head -n 1)

rm ip-obj.txt

sed "s/$(grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' restaurant-backend.isaias-tech.com.conf | head -n 1)/$IP/" restaurant-backend.isaias-tech.com

nginx -s reload
