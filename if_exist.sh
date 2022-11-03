#!/bin/bash

local branch=${1}
local existed_in_remote=$(git ls-remote --heads origin ${branch})

if [[ -z ${existed_in_remote} ]]; then
    return "not exist"
else
    return "exist"
fi