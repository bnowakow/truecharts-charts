#!/bin/bash -x

main_dir=$(pwd)

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
        charts/system/prometheus-operator; do
    app_common_dir=$dir/charts
    rm -rf $app_common_dir
    mkdir -p $app_common_dir
    cd $dir
    helm dependency build
    cd $main_dir
    git add $app_common_dir
done


