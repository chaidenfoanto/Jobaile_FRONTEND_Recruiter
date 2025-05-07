# 4. Local Data Persistence

## Status
Accepted

## Date
07/05/2025

## Decider
Team Lead @FranklinJaya2006

## Informed
@chaidenfoanto @feliciawijaya2006

## Context
Untuk mendukung pengembangan aplikasi **Jobaile** dalam hal penyimpanan data secara lokal di perangkat pengguna, sehingga data tersebut tetap tersedia bahkan setelah aplikasi ditutup atau perangkat dimatikan, maka aplikasi yang akan kami develop membutuhkkan Local Data Persistence yang bersifat andal, ringan, dan mudah diintegrasikan.

## Decision
Kami memilih menggunakan **ObjectBox** sebagai solusi local data persistence. ObjectBox merupakan database NoSQL yang dioptimalkan untuk performa tinggi, cocok untuk aplikasi Flutter dan mendukung reactive data binding.

## Alternative
- **SQLite**: Pilihan umum dan stabil, namun membutuhkan lebih banyak kode boilerplate dan manajemen skema manual.
- **Hive**: Ringan dan cepat, cocok untuk penyimpanan sederhana, namun kurang optimal untuk relasi kompleks.
- **Sembast**: Cocok untuk aplikasi kecil, namun tidak menawarkan performa tinggi seperti ObjectBox.

## Consequences

### Keuntungan
- Performa sangat cepat untuk read/write data.
- Integrasi mudah dengan Flutter dan memiliki dokumentasi lengkap.
- Mendukung reactive data stream.

### Potensi Risiko
- Ukuran library lebih besar dibanding Hive atau Sembast.
- Kurang fleksibel untuk kebutuhan relasional yang kompleks seperti SQL.

### Mitigasi
- Hanya menyimpan data yang benar-benar diperlukan untuk offline.
- Menggunakan ObjectBox untuk kebutuhan lokal sementara, dan sinkronisasi reguler dengan backend melalui REST API.