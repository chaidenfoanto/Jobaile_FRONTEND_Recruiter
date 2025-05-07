# 7. Theming & UI Styling

## Status
Accepted

## Date
07/05/2025

## Decider
Team Lead @FranklinJaya2006

## Informed
@chaidenfoanto @feliciawijaya2006

## Context
Aplikasi **Jobaile** adalah sebuah platform digital berbasis mobile yang dirancang untuk mempermudah masyarakat dalam mencari dan merekrut Asisten Rumah Tangga (ART). Aplikasi ini dikembangkan menggunakan Flutter sebagai framework frontend dan akan berjalan di platform Android. **Jobaile** melayani dua perspektif pengguna utama: POV Pencari Jasa (pengguna yang membutuhkan ART) dan POV Pencari Kerja (calon ART).

Persyaratan utama terkait UI pengguna adalah:
- **Tampilan dan Nuansa Profesional yang Konsisten**: Aplikasi **Jobaile** harus memiliki desain yang seragam dan di kedua platform Android untuk membangun kepercayaan dan memberikan pengalaman pengguna yang baik bagi Pencari Jasa maupun ART.
- **Identitas Merek yang Jelas**: Desain UI harus mampu mencerminkan identitas merek **Jobaile** secara kuat dan mudah dikenali.
- **Intuitif dan Mudah Digunakan**: Mengingat fungsionalitas inti seperti login & registrasi, pencarian ART, sistem instant match (mirip Tinder), dan pengelolaan kontrak kerja, antarmuka pengguna harus dirancang agar intuitif dan mudah dinavigasi oleh kedua jenis pengguna dengan latar belakang teknologi yang mungkin beragam.
- Sistem tema dan *styling* harus mendukung modularitas untuk memudahkan pengembangan fitur-fitur baru di masa depan dan skalabilitas seiring dengan pertumbuhan jumlah pengguna dan kompleksitas aplikasi.

Kendala yang dihadapi meliputi kebutuhan untuk optimalisasi waktu pengembangan agar aplikasi dapat segera diluncurkan, potensi kebutuhan kustomisasi desain yang spesifik untuk fitur-fitur unik **Jobaile** di masa mendatang, dan keinginan untuk memanfaatkan ekosistem Flutter secara maksimal sesuai dengan pilihan teknologi frontend yang telah ditetapkan. Komunikasi backend menggunakan REST API dengan Laravel 11 dan database MySQL (XAMPP) tidak secara langsung memengaruhi keputusan tema UI, namun efisiensi pengembangan frontend tetap menjadi prioritas.

## Decision
- Keinginan untuk tampilan dan nuansa yang konsisten, profesional, dan terpercaya di seluruh platform Android untuk kedua jenis pengguna aplikasi **Jobaile**.
- Kebutuhan untuk membangun dan memperkuat identitas merk **Jobaile** melalui desain visual.
- Persyaratan antarmuka pengguna yang intuitif dan mudah digunakan untuk fungsionalitas inti seperti pencarian, instant match, dan pengelolaan kontrak.
- Keinginan untuk memanfaatkan ekosistem dan kemampuan bawaan Flutter secara maksimal.
- Optimalisasi waktu dan sumber daya pengembangan frontend.

## Alternatives
Menerapkan Desain Custom Sepenuhnya Tanpa Material/Cupertino Theme
- Kelebihan: Kontrol penuh atas identitas visual dan pengalaman pengguna.
- Kekurangan: Membutuhkan waktu dan effort pengembangan UI yang jauh lebih besar; risiko ketidakkonsistenan antar screen jika tidak dikelola secara disiplin.

## Consequences

### Keuntungan
- Pengembangan UI awal aplikasi Jobaile lebih cepat, memungkinkan fokus pada fungsionalitas inti.
- Tampilan dan nuansa Jobaile yang profesional, konsisten dengan merek, dan terasa native bagi pengguna Android.
- Pemeliharaan tema Jobaile relatif lebih mudah karena sebagian besar fondasi dikelola oleh Flutter.

### Potensi Risiko
- Membutuhkan pemahaman yang baik tentang sistem tema Material dan Cupertino di Flutter untuk kustomisasi Jobaile yang efektif.
- Perlu kedisiplinan dalam menerapkan kustomisasi agar konsistensi merek Jobaile terjaga antara adaptasi Material dan Cupertino.

### Mitigasi
- Buat dokumentasi internal mengenai struktur tema dan konvensi styling Jobaile.
- Gunakan ThemeData dan TextTheme secara konsisten melalui Theme.of(context) agar kustomisasi tetap terpusat.