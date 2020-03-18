#! /bin/bash
echo "" >> log.txt
echo "" >> log.txt

date >> log.txt
git pull >> log.txt
cd COVID-19 
git checkout master >> log.txt
git pull >> log.txt
cd ..
python3 predict.py >> log.txt
git add images >> log.txt
git commit -m "CommitBot: Automatic commit" >> log.txt
git push >> log.txt
wall $(tail log.txt)
