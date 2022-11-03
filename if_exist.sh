#!/bin/bash

branch=$1
existed_in_remote=$(git branch --list | grep -c ${branch})

if [[ ${existed_in_remote} -gt 0 ]]; then
    echo "exist"
else
    echo "not exist"
fi

