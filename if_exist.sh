#!/bin/bash
branch=${1}
existed_in_remote=$(git ls-remote --heads origin ${branch})

if [[ -z ${existed_in_remote} ]]; then
	echo 0
else
	echo 1
fi
