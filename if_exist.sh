#!/bin/bash
branch=${1}
existed_in_remote=$(git ls-remote --heads origin ${branch})

if [[ -z ${existed_in_remote} ]]; then
	exit 0
else
	exit 1
fi
