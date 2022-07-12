#!/bin/bash

python /app/restaurant_backend/manage.py makemigrations 

python /app/restaurant_backend/manage.py migrate

python /app/restaurant_backend/manage.py collectstatic --noinput

gunicorn -c config/gunicorn/conf.py --bind :8000 --chdir restaurant_backend restaurant_backend.wsgi:application