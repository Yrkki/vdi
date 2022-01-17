#!/bin/bash

echo $'\033[1;33m'Running script install
echo ------------------------------------------------------$'\033[0m'
echo

echo $'\033[0;33m'Installing dependencies...$'\033[0m'
echo


d=$(pwd)

# ls ../../*/package.json | sed s/package.json//
for i in $(ls ../../*/package.json | sed s/package.json//);
# for i in $(find $dir -maxdepth 1 -type f);
do
    # echo $i
    # # ls $i
    cd $i
    pwd
    
    npm install

    cd $d
done

echo $'\033[1;32m'Dependencies installed.$'\033[0m'


echo
# read  -n 1 -p "x" input
