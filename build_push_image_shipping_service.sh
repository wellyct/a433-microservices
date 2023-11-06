#!/bin/bash

ghcr_user=wellyct

## Clear screen
clear

echo "--------------------------------------------------"
echo "  Script untuk build dan upload image shipping-service"
echo "=================================================="
echo "Tekan Ctrl+C untuk membatalkan!!"
sleep 5
echo ""


## membuat image shipping-service dengan tag latest, berdasarkan Dockerfiile
echo " 1. Build image dari folder proyek shipping-service:latest"
echo "---------------------------------------"
docker build -t shipping-service:latest .
echo ""

## Melihat daftar image di local
echo " 2. Check image shipping-service"
echo "--------------------------------------"
docker images | grep shipping-service
echo ""

## memberikan informasi image tag latest pada shipping-service
echo " 4. Memberikan informasi tag latest pada image shipping-service"
echo "----------------------------------------------------------"
docker tag shipping-service:latest ghcr.io/$ghcr_user/shipping-service:latest
echo "Done tag shipping-service:latest!"
echo ""

## login ghcr.io dengan menggunakan username dan token
echo " 5. Login ke https://ghcr.io/$ghcr_user"
echo "--------------------------------------"
echo $WELLYCT_PAT | docker login ghcr.io -u $ghcr_user --password-stdin
echo ""

## mengirimkan image shipping-service ke ghcr.io
echo " 6. Mengirimkan image shipping-service:latest ..."
echo "--------------------------------------------"
docker push ghcr.io/$ghcr_user/shipping-service:latest
echo ""

## melihat informasi image shipping-service:latest yang sudah di upload di ghcr.io
echo " 7. Informasi image shipping-service:latest di https://ghcr.io/$ghcr_user"
echo "-----------------------------------------------------------------"
docker inspect ghcr.io/$ghcr_user/shipping-service:latest
echo ""
echo "FINISH!"
echo ""
