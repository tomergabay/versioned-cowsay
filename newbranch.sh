#!/bin/bash 
if [ $? -eq 0 ] 
then 
  git checkout -b $1
  echo "not for realese" > v.txt
  echo ${env.BRANCH} >> v.txt
  git commit -am"$1"
else 
  git checkout $1
fi
