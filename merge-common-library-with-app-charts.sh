#!/bin/bash

# TODO updage common library git submodule
library_common_dir=library-charts/library/common


for dir in \
        charts/stable/sonarr \
        charts/stable/radarr \
        ./charts/stable/bazarr \
    ; do
    app_common_dir=$dir/charts
    rm -rf $app_common_dir
    mkdir -p $app_common_dir
    cp -r $library_common_dir $app_common_dir
    git add $app_common_dir
done

git status

