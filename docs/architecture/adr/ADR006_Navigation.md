# 6. Navigation & Routing Solution

## Status
Proposed

## Date
07/05/2025

## Decider
Team Lead @FranklinJaya2006

## Informed
@chaidenfoanto @feliciawijaya2006

## Context

### Dalam mengembangkan aplikasi Frontend dari **Jobaile**, kami perlu cara untuk melakukan navigasi untuk berpindah dan mengakses aplikasi. Oleh karena itu, kami perlu menentukan metode navigasi bagi aplikasi kami. Akan tetapi, karena keterbatasan tenaga kerja dan waktu yang tersisa, kami memerlukan sistem navigasi yang mudah untuk kami implementasikan.

## Decision
Tim kami lebih memilih menggunakan go-router dikarenakan beberapa faktor, yaitu: 
- Implementasi nya yang terbilang cukup mudah.
- Memudahkan pengelolaan rute dan halaman, menjaga aplikasi tetap terstruktur.
- Membuat kode lebih rapi dan mudah dipelihara.

## Alternative
Kami sempat mempertimbangkan penggunaan Navigator 1.0 dan Navigator 2.0, namun meskipun masing-masing memiliki kelebihan, ada beberapa kelemahan yang perlu dipertimbangkan:
1. Kelebihan dan kelemahan Navigator 1.0: 
    - Kelebihan:
        - Lebih mudah digunakan dan sudah biasa digunakan oleh anggota tim.
    - Kelemahan: 
        - Sulit mengelola deep linking.
        - Tidak Ada Dukungan untuk Declarative Navigation.
        - Akan kompleks jika ingin mengembangkan aplikasi.
2. Kelebihan dan kelemahan Navigator 2.0: 
    - Kelebihan:
        - Fleksibilitas dan Kontrol Penuh
    - Kelemahan:
        - Kompleksitas implementasi.
        - Bisa memakan waktu dan membingungkan.

## Consequences

### Keuntungan 
- Mendukung Deep Linking & Nested Routes
- Kode yang lebih rapi

### Potensi Risiko
- Ketergantungan pada Paket Pihak Ketiga

### Mitigasi
- Hindari penggunaan fitur eksperimental atau belum stabil dari go_router.
- Pastikan kebutuhan navigasi aplikasi telah dipetakan sejak awal dan sesuai dengan kemampuan go_router.
