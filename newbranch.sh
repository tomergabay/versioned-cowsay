#!/bin/bash 
if [ $? -eq 0 ] 
then 
  git checkout -b ${env.BRANCH}
  echo "not for realese" > v.txt
  echo ${env.BRANCH} >> v.txt
  git commit -am"${env.BRANCH}"
else 
  git checkout ${env.BRANCH} 
fi