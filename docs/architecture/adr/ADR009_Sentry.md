# 9. Error Handling & Monitoring

## Status
Accepted

## Date
07/05/2025

## Decider
Team Lead @FranklinJaya2006

## Informed
@chaidenfoanto @feliciawijaya2006

## Context
Aplikasi Jobaile adalah platform mobile yang dikembangkan untuk mempertemukan pencari jasa (pengguna) dan pencari kerja (ART) secara cepat dan terpercaya. Aplikasi ini menggunakan Flutter untuk frontend dan Laravel 11 untuk backend, dengan komunikasi melalui REST API. Sebagai aplikasi yang akan digunakan secara aktif oleh dua jenis pengguna dengan peran dan aktivitas berbeda, pengembang membutuhkan sistem pemantauan yang dapat:
- Menangkap error dan crash pada saat runtime, baik di sisi client maupun server.
- Menyediakan laporan real-time agar tim pengembang dapat segera melakukan debugging.
- Memberikan konteks menyeluruh terhadap error seperti perangkat, versi aplikasi, dan langkah-langkah yang mengarah ke error (breadcrumbs).
- Mendukung skalabilitas dan tetap ringan digunakan.

## Decision
Kami memutuskan untuk menggunakan Sentry sebagai alat utama untuk monitoring error dan crash di aplikasi Jobaile, karena:
- Sentry mendukung Flutter dan Laravel/PHP, sehingga dapat digunakan di kedua sisi (frontend & backend).
- Memiliki versi gratis dengan fitur yang cukup untuk tahap awal pengembangan.
- Menyediakan real-time reporting, stack trace yang jelas, serta integrasi dengan notifikasi seperti email atau Slack.
- Sentry sudah terbukti stabil, banyak digunakan oleh komunitas, dan mudah untuk diintegrasikan.

## Alternatives
- **Firebase Crashlytics**
    - Kelebihan: Terintegrasi dengan baik di ekosistem Google dan Firebase, sangat cocok untuk Android.
    - Kekurangan: Tidak mendukung backend Laravel, integrasi di luar ekosistem Firebase kurang fleksibel.
- **Custom Logging (Backend dan Frontend)**
    - Kelebihan: Fleksibel, bisa disesuaikan penuh dengan kebutuhan sendiri.
    - Kekurangan: Memerlukan waktu pengembangan dan pemeliharaan lebih lama, tidak real-time, dan kurang praktis untuk tracing lintas platform.
- **Bugsnag**
    - Kelebihan: Antarmuka menarik, fitur mirip dengan Sentry.
    - Kekurangan: Tidak memiliki versi gratis dengan fitur selengkap Sentry.

## Consequences

### Keuntungan
- Sentry menyediakan pelacakan error secara real-time dengan stack trace yang lengkap dan konteks pengguna, sehingga mempermudah proses debugging dan mempercepat penyelesaian masalah.
- Sentry mendukung Flutter dan Laravel, sehingga memungkinkan pemantauan yang terpadu di sisi frontend dan backend tanpa perlu alat terpisah.

### Potensi Risiko
- Terdapat risiko data sensitif pengguna atau sistem terkirim ke server Sentry jika tidak difilter dengan benar.
- Paket gratis memiliki batasan kuota bulanan, yang bisa terlampaui seiring pertumbuhan aplikasi dan memerlukan biaya tambahan untuk fitur premium.

### Mitigasi
- Aktifkan fitur data scrubbing dan filter manual pada event sebelum dikirim ke Sentry.
- Batasi jumlah event dengan sampleRate dan kirim hanya error penting (error/fatal), serta pantau penggunaan kuota secara rutin.