#!/bin/bash

git checkout master \
    && git pull \
    && git checkout bnowakow \
    && git merge master --no-edit \
    && ./merge-common-library-with-app-charts.sh \
    && git push \
    && git status

