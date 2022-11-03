#!/bin/bash 
git pull
if [ $? -eq 0 ] 
then 
  git checkout -b $1
  echo "not for realese" > v.txt
  echo "TAG:$1" >> v.txt
  git commit -am"$1"
  git push -uf origin $1
  git checkout main
else 
  git checkout $1
fi
