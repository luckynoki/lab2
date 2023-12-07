#!/bin/bash

DISALLOWED_IP="$(ip a s ens33 | grep inet | head --lines=1 | awk '{print $2}' | cut -d'/' -f1 | tr -d '\n')"

sudo apt install -y python3 python3-pip
pip install Django==4.0
pip install Pillow
git clone https://github.com/PacktPublishing/Django-4-for-the-Impatient
cp -R Django-4-for-the-Impatient/Chapter11/moviereviewsproject/ moviereviewsproject
cd moviereviewsproject
sed -i 's/ALLOWED_HOSTS = \[\]/ALLOWED_HOSTS = \['\'$DISALLOWED_IP\''\]/g' ./moviereviews/settings.py
python3 manage.py runserver 0.0.0.0:8000
