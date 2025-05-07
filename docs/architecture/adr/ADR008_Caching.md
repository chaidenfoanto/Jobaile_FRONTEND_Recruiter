# 8. Offline Support & Caching

## Status
Proposed

## Date
07/05/2025

## Decider
Team Lead @FranklinJaya2006

## Informed
@chaidenfoanto @feliciawijaya2006

## Context
Aplikasi **Jobaile** dirancang untuk digunakan oleh ART (Asisten Rumah Tangga) dan pencari kerja di berbagai lokasi, termasuk area dengan konektivitas internet yang terbatas atau tidak stabil. Maka dari itu, diperlukan mekanisme yang akan digunakan ketika aplikasi diakses secara offline, dan pengelolaan cache agar transfer data tidak selalu terjadi.

## Decision
Kami memutuskan menggunakan mekanisme offline first, offline first merupakan pendekatan dalam pengembangan aplikasi di mana aplikasi dirancang agar dapat berfungsi secara optimal meskipun tanpa koneksi internet.

## Alternatives
Kami sempat memutuskan untuk mengggunakan Online First, karena memiliki beberapa keuntungan, tetapi terdapat beberapa kelemahan yang perlu kami pertimbangkan: 
Kelebihan:
- Tidak ada kekhawatiran tentang data yang sudah kadaluarsa atau tidak sinkron.
- Pengguna tidak perlu khawatir mengenai penggunaan penyimpanan lokal yang berlebihan.
Kelemahan:
- Pengguna tidak dapat mengakses aplikasi atau data ketika tidak ada koneksi internet, yang mengurangi fleksibilitas penggunaan di daerah dengan jaringan yang buruk.
- Boros kuota.

## Consequences

### Keuntungan
- Membuat aplikasi lebih ringan dan cepat saat digunakan.
- Bisa menghemat kuota internet pengguna.
- Meningkatkan pengalaman pengguna karena aplikasi tetap berfungsi secara lancar meskipun berada di area dengan sinyal internet yang lemah.

### Poteensi Risiko
- **Sinkronisasi Data Ganda atau Konflik**: Risiko data tidak sinkron antara versi lokal dan versi server, terutama jika pengguna melakukan perubahan secara bersamaan pada dua perangkat atau sebelum sinkronisasi selesai.
- **Data Kadaluarsa**: Informasi yang ditampilkan bisa jadi tidak up-to-date jika terlalu lama berada dalam mode offline.
- **Konsumsi Penyimpanan Lokal**: Cache atau penyimpanan data offline yang terlalu besar bisa membebani memori perangkat, terutama pada perangkat dengan kapasitas rendah.

### Mitigasi
- Sinkronisasi otomatis saat aplikasi kembali online, dengan indikator atau notifikasi kepada pengguna bila terjadi konflik.
