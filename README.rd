# High Availability Nginx Load Balancer & Reverse Proxy

Bu proje, **Docker** ve **Nginx** teknolojileri kullanılarak oluşturulmuş, hataya dayanıklı (Fault Tolerant) ve ölçeklenebilir bir web sunucu mimarisidir.

Projenin temel amacı; gelen trafiği tek bir sunucuya yüklemek yerine, **Round-Robin** algoritması kullanarak birden fazla "Backend" sunucuya (Mavi/Yeşil) dağıtmak ve sistemin sürekliliğini sağlamaktır.

## 🚀 Proje Mimarisi

Sistem 3 ana konteynerden oluşur ve izole bir Docker ağı üzerinde haberleşir:

1.  **Load Balancer (Nginx):** Dış dünyadan (Port 8080) gelen istekleri karşılar ve "Reverse Proxy" olarak görev yapar.
2.  **Site Blue (Backend 1):** Web uygulamasının bir kopyasını barındırır.
3.  **Site Green (Backend 2):** Web uygulamasının ikinci kopyasını barındırır.

Tüm servisler, birbirini Docker'ın **Service Discovery** (DNS) özelliği sayesinde isimleri (site-blue, site-green) üzerinden tanır.

## 🛠️ Kullanılan Teknolojiler ve Yetkinlikler

* **Docker & Containerization:** Uygulamaların izole ortamlarda çalıştırılması.
* **Nginx:** Reverse Proxy ve Load Balancing konfigürasyonu.
* **Linux Networking:** `iptables` ve IP Forwarding yönetimi ile ağ trafiği kontrolü.
* **Bash Scripting:** `deploy.sh` ile tüm altyapının (Infrastructure) tek komutla kurulup yönetilmesi (Basic CI/CD).
* **Volume Management:** Host ve Container arasında veri tutarlılığı.

## ⚙️ Kurulum ve Çalıştırma

Bu projeyi yerel makinenizde çalıştırmak için Docker'ın yüklü olması yeterlidir.

1. **Repoyu Klonlayın:**
   ```bash
   git clone [https://github.com/KULLANICI_ADIN/nginx-load-balancer-project.git](https://github.com/KULLANICI_ADIN/nginx-load-balancer-project.git)
   cd nginx-load-balancer-project
