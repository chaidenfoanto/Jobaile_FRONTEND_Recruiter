# 1. App Architecture Pattern

## Status
Accepted

## Date
07/05/2025

## Decider
Team Lead @FranklinJaya2006

## Informed
@chaidenfoanto @feliciawijaya2006

## Context
Aplikasi **Jobaile** dikembangkan sebagai aplikasi mobile menggunakan Flutter, dengan backend Laravel 11 dan MySQL sebagai database. **Jobaile** bertujuan untuk menghubungkan dua jenis pengguna, yaitu pencari jasa (misalnya ibu rumah tangga atau pasangan suami istri yang sibuk bekerja) dengan pencari kerja (ART atau tenaga kerja informal lainnya) secara lebih cepat, transparan, dan terpercaya.

Aplikasi ini akan memiliki fitur seperti pencarian ART berdasarkan preferensi, *instant match* seperti Tinder, chat, dan kontrak kerja secara digital.

Oleh karena itu kami memerlukan arsitektur yang mampu:
- Memisahkan tanggung jawab antar komponen aplikasi (logika bisnis, data, dan antarmuka pengguna).
- Mempermudah pengujian unit secara independen.
- Mendukung pengembangan fitur yang scalable dan maintainable.

## Decision
Kami memilih untuk menggunakan arsitektur **Model-View-Controller (MVC)** untuk backend Laravel. Framework Laravel secara native mendukung arsitektur MVC dan memfasilitasi pengembang dalam memisahkan tanggung jawab antar komponen melalui struktur folder yang jelas dan penggunaan Eloquent ORM.

Penjelasan mengenai komponen MVC:
- **Model**: Bertanggung jawab untuk mengelola data dan aturan bisnis. Di Laravel, model terhubung langsung dengan database menggunakan Eloquent ORM untuk mengelola entitas seperti pengguna, ART, dan kontrak kerja.
- **View**: Menyediakan UI yang akan dilihat oleh pengguna. Dalam konteks backend, ini bisa berupa respons JSON ke frontend. Dalam Flutter, View direpresentasikan oleh tampilan UI aplikasi.
- **Controller**: Menjembatani antara model dan view. Controller menerima permintaan dari pengguna (melalui frontend), memproses logika aplikasi, lalu mengembalikan data melalui View.

## Alternative
- **MVVM**: Cocok untuk Flutter, menawarkan pemisahan yang baik antara logika UI dan state, tetapi memerlukan lebih banyak boilerplate dan kompleksitas tambahan.
- **Clean Architecture**: Memberikan struktur yang sangat modular, tetapi memerlukan banyak abstraksi dan belum diperlukan untuk skala proyek saat ini.

## Consequences

### Keuntungan
- Struktur kode lebih rapi dan mudah dipelihara.
- Pengembangan bisa dilakukan secara paralel antara frontend dan backend.
- Cocok untuk tim dengan latar belakang Laravel dan Flutter.

### Potensi Risiko
- Kurang fleksibel dibandingkan Clean Architecture dalam skala enterprise yang lebih besar.
- Butuh kedisiplinan dalam menjaga pemisahan tanggung jawab antar komponen agar tidak tercampur.

### Mitigasi
- Menetapkan konvensi kode sejak awal dan melakukan code review secara rutin.
- Menyusun dokumentasi teknis internal untuk menjaga konsistensi implementasi MVC di seluruh tim.