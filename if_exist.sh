#!/bin/bash
branch=${1}
existed_in_remote=$(git ls-remote --heads origin ${branch})

if [[ -z ${existed_in_remote} ]]; then
	return 0
else
	return 1
fi
