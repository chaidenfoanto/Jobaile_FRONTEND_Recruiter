# 5. Dependency Injection Framework

## Status
Accepted

## Date
07/05/2025

## Decider
Team Lead @FranklinJaya2006

## Informed
@chaidenfoanto @feliciawijaya2006

## Context
Dalam pengembangan aplikasi **Jobaile** menggunakan Flutter, Dependency Injection (DI) diperlukan untuk memisahkan proses pembuatan objek dari penggunaannya. Hal ini bertujuan untuk meningkatkan modularitas, kemudahan dalam pengujian unit, dan skalabilitas aplikasi seiring bertambahnya kompleksitas fitur. Framework DI akan sangat membantu untuk mengelola dependensi antar komponen, terutama ketika aplikasi mulai memiliki banyak service, repository, dan controller.

## Decision
Kami memilih menggunakan **GetIt** sebagai framework Dependency Injection pada aplikasi Jobaile.

GetIt merupakan service locator yang ringan dan mudah digunakan di Flutter. Penggunaannya tidak mengharuskan boilerplate berlebih, sehingga mempercepat proses setup dan integrasi. GetIt juga sangat cocok untuk dipasangkan dengan arsitektur BLoC yang telah dipilih pada ADR-002, serta mendukung berbagai use-case yang umum dalam pengembangan aplikasi Flutter.

## Alternative
- **injectable**: Menyediakan otomatisasi DI melalui anotasi, namun memerlukan konfigurasi tambahan dan build_runner, yang menambah beban pengelolaan proyek.
- **Provider-based injection**: Lebih sederhana dan banyak digunakan, tetapi tidak sekuat GetIt untuk struktur DI kompleks dan cenderung membingungkan jika digunakan untuk service locator murni.

## Consequences

### Keuntungan
- Mudah diintegrasikan dan digunakan dalam proyek Flutter.
- Mendukung pengelolaan service secara global tanpa perlu boilerplate berlebih.
- Memudahkan pengujian unit dan integrasi dengan dependensi yang dapat dimock.

### Potensi Risiko
- Pendekatan service locator seperti GetIt kadang menimbulkan anti-pattern jika tidak digunakan dengan disiplin.
- Kurangnya sistem validasi atau pelacakan dependensi seperti pada injectable bisa menyebabkan error runtime jika tidak terdaftar dengan benar.

### Mitigasi 
- Membuat konvensi internal tim untuk mendaftarkan dan menghapus dependensi dengan tepat.
- Melakukan code review untuk memastikan GetIt digunakan hanya untuk layer-layer service dan repository, bukan untuk semua jenis objek.