#!/usr/bin/bash

for i in Github/*; 
do
if [ -d $i ];
then cd $i;
bash -c "git add . && git commit -m "commit" && git push";
cd -;
fi;
done
