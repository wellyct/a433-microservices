#!/bin/bash

ghcr_user=wellyct

## Clear screen
clear

echo "--------------------------------------------------"
echo "  Script untuk build dan upload image karsajob-ui"
echo "=================================================="
echo "Tekan Ctrl+C untuk membatalkan!!"
sleep 5
echo ""

## membuat image karsajobs-ui dengan tag latest, berdasarkan Dockerfiile
echo " 1. Build image dari karsajobs-ui:latest"
echo "------------------------------------------"
docker build -t karsajobs-ui:latest .
echo ""

## menyimpan kode token akses ghcr.io ke variable
echo "EXPORT WELLYCT_PAT - ##KODE_TOKEN_ACCESS##" >> /home/apps/.bashrc

## login ghcr.io dengan menggunakan username dan token
echo " 2. Login ke https://ghcr.io/$ghcr_user"
echo "--------------------------------------"
echo $WELLYCT_PAT | docker login ghcr.io -u $ghcr_user --password-stdin
echo ""

## memberikan informasi image tag latest karsajobs-ui
echo " 3. Memberikan informasi tag latest pada image karsajobs-ui"
echo "------------------------------------------------------------"
docker tag karsajobs-ui:latest ghcr.io/$ghcr_user/karsajobs-ui:latest
echo "Done tag karsajobs:latest!"
echo ""

## mengirimkan image karsajobs-ui:latest ke ghcr.io
echo " 4. Mengirimkan image karsajobs-ui:latest ..."
echo "-----------------------------------------------"
docker push ghcr.io/$ghcr_user/karsajobs-ui:latest
echo "Done push!"
echo ""
## melihat informasi image karsajobs-ui:latest yang sudah di upload
echo " 5. Informasi image karsajobs-ui:latest di https://ghcr.io/$ghcr_user"
echo "--------------------------------------------------------------------"
docker inspect ghcr.io/$ghcr_user/karsajobs-ui:latest
echo ""
echo "FINISH!"
echo ""