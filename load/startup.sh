#! /bin/bash
apt-get update
cd /home/nicholasutikal/load_footy_import
source venv/bin/activate
cd /home/nicholasutikal/load_footy_import/src
python3 main.py
