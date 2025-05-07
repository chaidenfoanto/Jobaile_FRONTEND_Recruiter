# 2. State Management Approach

## Status
Accepted

## Date
07/05/2025

## Decider
Team Lead @FranklinJaya2006

## Informed
@chaidenfoanto @feliciawijaya2006

## Context
Aplikasi **Jobaile** dikembangkan menggunakan Flutter sebagai framework frontend. Untuk mendukung manajemen state yang kompleks, kami membutuhkan pendekatan yang terstruktur dan dapat menangani interaksi antar UI, business logic, dan data asynchronous secara efisien.

## Decision
Kami memilih menggunakan **BLoC (Business Logic Component)** sebagai pendekatan state management utama pada aplikasi Jobaile.

BLoC dipilih karena menyediakan pemisahan yang jelas antara UI dan logika bisnis, mendukung reactive programming menggunakan stream, serta telah teruji luas dalam pengembangan aplikasi Flutter yang kompleks.

## Alternative
- **Provider**: Lebih sederhana dan cocok untuk aplikasi kecil hingga menengah, namun tidak memiliki struktur sekuat BLoC dalam memisahkan logika bisnis.
- **Riverpod**: Lebih fleksibel dan modular dibanding Provider, tetapi memerlukan pembelajaran tambahan dan belum sepopuler BLoC.

## Consequences

### Keuntungan
- Memisahkan logika bisnis dari tampilan UI, sehingga lebih mudah diuji dan dipelihara.
- Mendukung arsitektur reactive dengan Stream yang efisien untuk data asynchronous.
- Cocok untuk proyek jangka panjang yang berpotensi tumbuh lebih kompleks.

### Potensi Risiko
- Boilerplate code lebih banyak, terutama pada implementasi awal.

### Mitigasi
- Menggunakan library seperti `flutter_bloc` untuk menyederhanakan implementasi.
- Menyediakan template agar lebih mudah digunakan berulang kali
- Menyediakan dokumentasi internal dan panduan implementasi bagi tim pengembang baru.

