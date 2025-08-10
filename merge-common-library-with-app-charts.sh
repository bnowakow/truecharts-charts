#!/bin/bash

# there's a same named chart in rancher repo with different versioning
rm -rf ./charts/system/cert-manager

helm repo add cloudnative-pg https://cloudnative-pg.github.io/charts

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
        charts/system/prometheus-operator \
        charts/stable/nginx-proxy-manager \
        charts/premium/authelia \
        charts/stable/pgadmin \
        charts/stable/scrypted \
        charts/stable/recyclarr \
        charts/system/kubeapps \
	    charts/stable/readarr \
        charts/stable/calibre \
	; do
    echo $dir
    app_common_dir=$dir/charts
    #rm -rf $app_common_dir
    mkdir -p $app_common_dir
    cd $dir
    rm Chart.lock
    helm dependency build
#    cd charts
#    helm package ../
    cd $main_dir
    git add $app_common_dir
    echo
done


