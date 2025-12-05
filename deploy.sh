#!/bin/bash

# Hata olursa scripti durdur (Güvenlik önlemi)
set -e

echo "🚀 Dağıtım (Deployment) Başlıyor..."

# 1. Eski konteynerleri temizle (Varsa sil, yoksa hata verme)
echo "🧹 Eski konteynerler temizleniyor..."
docker rm -f site-blue site-green load-balancer || true

# 2. Ağı kontrol et (Yoksa oluştur)
docker network inspect traffic-net >/dev/null 2>&1 || docker network create --driver bridge traffic-net

# 3. Mavi Siteyi Başlat
echo "🏗️  Mavi Site kuruluyor..."
docker run -d \
  --name site-blue \
  --network traffic-net \
  -v /home/muge/traffic-project/site-blue:/usr/share/nginx/html \
  nginx:alpine

# 4. Yeşil Siteyi Başlat
echo "🏗️  Yeşil Site kuruluyor..."
docker run -d \
  --name site-green \
  --network traffic-net \
  -v /home/muge/traffic-project/site-green:/usr/share/nginx/html \
  nginx:alpine

# 5. Load Balancer'ı Başlat
echo "⚖️  Load Balancer kuruluyor..."
docker run -d \
  --name load-balancer \
  --network traffic-net \
  -p 8080:80 \
  -v /home/muge/traffic-project/nginx-conf/nginx.conf:/etc/nginx/nginx.conf:ro \
  nginx:alpine

echo "✅ İşlem Tamam! http://localhost:8080 adresine gidebilirsin."
