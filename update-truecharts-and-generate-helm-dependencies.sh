#!/bin/bash

cd /home/sup/code/bash_configs/repos/truecharts; 
git checkout bnowakow; 
git reset --hard; 
git pull; 
git pull origin master; 
git push; 
./merge-common-library-with-app-charts.sh

