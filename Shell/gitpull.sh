#!/usr/bin/bash

for i in Github/*; 
do
if [ -d $i ];
then cd $i;
bash -c "git pull";
cd -;
fi;
done
