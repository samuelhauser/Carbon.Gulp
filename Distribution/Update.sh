#!/bin/bash

## You have to install json if you want to merge .json files
## https://www.npmjs.com/package/json
## yarn global add json

. "$PWD/Build/Gulp/Distribution/Helper/SetColors.sh"
if which json > /dev/null
  then
    . "$PWD/Build/Gulp/Distribution/Helper/MergePackageJson.sh"
  else
    . "$PWD/Build/Gulp/Distribution/Helper/NoJsonInstalled.sh"
fi
. "$PWD/Build/Gulp/Distribution/Helper/System.sh"

echo $GREEN
echo "Update dependencies"
echo $NC
yarn

exit 0
