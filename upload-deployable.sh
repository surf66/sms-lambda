#! /bin/bash

if [ -z "$1" ] ; then 
  echo "Must provide version number"
  exit 1
fi

mkdir build

cd src

zip -r ../build/deployable.zip .

cd ../build

aws s3 sync ./ s3://surf66-lambda/v$1