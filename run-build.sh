#!/bin/bash

if [ .$1 == '.' ] ; then 
    export REPO=indilib/indi 
else 
    export REPO=$1 
fi 

if [ .$2 == '.' ] ; then 
    export CIRCLE_BRANCH=master ; 
else 
    export CIRCLE_BRANCH=$2 ; 
fi 

git clone https://github.com/${REPO}.git indi
cd indi 
git checkout $CIRCLE_BRANCH

./CI/circle/build-all.sh
./CI/circle/run-tests.sh
