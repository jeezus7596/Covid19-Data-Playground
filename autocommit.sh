#! /bin/bash

wall Starting commit
git pull
cd COVID-19
git checkout master
git pull
cd ..
python3 predict.py
git add images
git commit -m "CommitBot: Automatic commit"
git push
wall Done pushing
