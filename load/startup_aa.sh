#! /bin/bash
apt-get update
cd /home/nicholasutikal/transform_aa
source venv/bin/activate
cd /home/nicholasutikal/transform_aa/src
python3 main.py
deactivate

cd /home/nicholasutikal/transform_preprocess
source venv/bin/activate
cd /home/nicholasutikal/transform_preprocess/src
python3 main.py
deactivate

cd /home/nicholasutikal/transform_ml
source venv/bin/activate
cd /home/nicholasutikal/transform_ml/src
python3 main.py
deactivate