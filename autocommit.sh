#! /bin/bash

cd COVID-19
git checkout master
git pull
cd ..
python predict.py
git add images
git commit -m "Automatic commit"
git push