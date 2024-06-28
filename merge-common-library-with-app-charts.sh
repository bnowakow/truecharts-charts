#!/bin/bash

library_dir=library-charts
library_common_dir=$library_dir/library/common
cd $library_dir
git pull
cd ../

cloudnativepg_dir=CloudNativePG-charts
cloudnativepg_chart_dir=$cloudnativepg_dir/charts/*
cd $cloudnativepg_dir
git pull
cd ../

for dir in \
        charts/stable/sonarr \
        charts/stable/radarr \
        charts/stable/bazarr \
        charts/stable/overseerr \
        charts/stable/jellyfin \
        charts/stable/jellyseerr \
        charts/stable/jackett \
        charts/stable/prowlarr \
        charts/stable/plex \
        charts/stable/homer \
        charts/stable/bazarr \
        charts/stable/flaresolverr \
        charts/stable/scrutiny \
        charts/stable/adguard-home \
        charts/stable/jellystat \
        charts/stable/duckdns \
        charts/stable/filebot \
        charts/stable/lazylibrarian \
        charts/stable/maintainerr \
        charts/stable/plextraktsync \
        charts/stable/proxmox-backup-server \
        charts/stable/scrutiny \
        charts/stable/smokeping \
        charts/stable/tautulli \
        charts/stable/youtubedl-material \
        charts/system/cloudnative-pg \
    ; do
    app_common_dir=$dir/charts
    rm -rf $app_common_dir
    mkdir -p $app_common_dir
    cp -r $library_common_dir $app_common_dir
    git add $app_common_dir
done

# TODO create function to use repeating logic from above
for dir in \
        charts/stable/jellystat \
        charts/system/cloudnative-pg \
    ; do
    app_common_dir=$dir/charts
    cp -r $cloudnativepg_chart_dir $app_common_dir
    git add $app_common_dir
done

git status

