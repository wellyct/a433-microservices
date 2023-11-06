#!/bin/bash

ghcr_user=wellyct

## Clear screen
clear

echo "--------------------------------------------------"
echo "  Script untuk build dan upload image order-service"
echo "=================================================="
echo "Tekan Ctrl+C untuk membatalkan!!"
sleep 5
echo ""


## membuat image order-service dengan tag latest, berdasarkan Dockerfiile
echo " 1. Build image dari folder proyek order-service:latest"
echo "---------------------------------------"
docker build -t order-service:latest .
echo ""

## Melihat daftar image di local
echo " 2. Check image order-service"
echo "--------------------------------------"
docker images | grep order-service
echo ""

## memberikan informasi image tag latest pada order-service
echo " 4. Memberikan informasi tag latest pada image order-service"
echo "----------------------------------------------------------"
docker tag order-service:latest ghcr.io/$ghcr_user/order-service:latest
echo "Done tag order-service:latest!"
echo ""

## login ghcr.io dengan menggunakan username dan token
echo " 5. Login ke https://ghcr.io/$ghcr_user"
echo "--------------------------------------"
echo $WELLYCT_PAT | docker login ghcr.io -u $ghcr_user --password-stdin
echo ""

## mengirimkan image order-service ke ghcr.io
echo " 6. Mengirimkan image order-service:latest ..."
echo "--------------------------------------------"
docker push ghcr.io/$ghcr_user/order-service:latest
echo ""

## melihat informasi image order-service:latest yang sudah di upload di ghcr.io
echo " 7. Informasi image order-service:latest di https://ghcr.io/$ghcr_user"
echo "-----------------------------------------------------------------"
docker inspect ghcr.io/$ghcr_user/order-service:latest
echo ""
echo "FINISH!"
echo ""