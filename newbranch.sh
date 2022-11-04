#!/bin/bash 

if [ $? -eq 0 ] 
then 
  git checkout -b $1
  git config --global user.email "tomeriko01012001@gmail.com"
  git config --global user.name "tomer_gab"
  echo "not for realese" > v.txt
  echo "TAG:$1" >> v.txt
  git commit -am"$1"
  { echo 'tomer_gab';echo 'tomergab1342';} | git push -uf origin $1
#  git checkout main
else 
  git checkout $1
fi
