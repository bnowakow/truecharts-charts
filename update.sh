#!/bin/bash

git checkout master \
    && git pull \
    && git checkout bnowakow \
    && git merge master \
    && ./merge-common-library-with-app-charts.sh \
    && git push \
    && git status

