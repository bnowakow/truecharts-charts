#!/bin/bash -x

#cd /mnt/MargokPool/home/sup/code/bash_configs/repos/truecharts

git checkout master \
    && git pull \
    && git push \
    && git checkout bnowakow \
    && git merge master --no-edit \
    && ./merge-common-library-with-app-charts.sh \
    && git push \
    && git status

