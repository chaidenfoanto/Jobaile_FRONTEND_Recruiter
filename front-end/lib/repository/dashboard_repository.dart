import '../models/worker.dart';

class DashboardRepository {
  Future<List<Worker>> fetchHelpers() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      Worker(
        id: '1',
        name: 'Nur Harmawati Kudus',
        age: 28,
        imagePath: 'assets/images/helper_dashboard/helper1.png',
        isAsset: true,
        rating: 4.5,
        description: 'Berpengalaman lebih dari 3 tahun sebagai ART, terbiasa mengurus dan membersihkan rumah secara detail. Ramah dan disiplin dalam bekerja.',
        shortDescription: 'Berpengalaman lebih dari 3 tahun sebagai ART, terbiasa mengurus anak dan membersihkan rumah secara detail.',
        location: 'Kudus, Jawa Tengah',
        experienceTitle: 'Asisten Rumah Tangga di Jakarta',
        experiencePeriod: '2020 - 2023',
        experienceDetails: [
          'Merawat dua anak usia balita',
          'Memasak makanan sehat setiap hari',
          'Membersihkan rumah 2 lantai',
        ],
      ),
      Worker(
        id: '2',
        name: 'Siti Komariah',
        age: 55,
        imagePath: 'assets/images/helper_dashboard/helper2.png',
        isAsset: true,
        rating: 4.0,
        description: 'Ahli dalam memasak makanan rumahan, rapi dalam pekerjaan, dan sudah terbiasa bekerja dengan keluarga yang memiliki anak kecil dan hewan kelinci.',
        shortDescription: 'Ahli dalam memasak makanan rumahan dan telaten mengurus anak kecil dan hewan peliharaan.',
        location: 'Surabaya, Jawa Timur',
        experienceTitle: 'ART dan Juru Masak',
        experiencePeriod: '2018 - 2023',
        experienceDetails: [
          'Memasak untuk keluarga dengan 5 anggota',
          'Mengurus anak dan hewan peliharaan',
          'Membersihkan dan merapikan rumah',
        ],
      ),
      Worker(
        id: '3',
        name: 'Yuni Lestari',
        age: 31,
        imagePath: 'assets/images/helper_dashboard/helper3.png',
        isAsset: true,
        rating: 4.0,
        description: 'Telaten dan sabar, cocok untuk menjaga lansia atau anak. Pernah bekerja sebagai ART tinggal dalam selama 2 tahun di Mks.',
        shortDescription: 'Telaten dan sabar, cocok untuk menjaga lansia atau anak.',
        location: 'Makassar, Sulawesi Selatan',
        experienceTitle: 'ART Tinggal Dalam',
        experiencePeriod: '2019 - 2021',
        experienceDetails: [
          'Merawat lansia usia 80 tahun',
          'Memasak masakan khas daerah',
          'Mengelola rumah tangga sendiri',
        ],
      ),
      Worker(
        id: '4',
        name: 'Kiran Natasya Kenta',
        age: 19,
        imagePath: 'assets/images/helper_dashboard/helper4.png',
        isAsset: true,
        rating: 3.0,
        description: 'Berpengalaman merawat balita dengan telaten dan sabar. Terbiasa mengikuti jadwal dan disiplin waktu.',
        shortDescription: 'Berpengalaman merawat balita dengan telaten dan sabar.',
        location: 'Bandung, Jawa Barat',
        experienceTitle: 'Babysitter',
        experiencePeriod: '2022 - 2023',
        experienceDetails: [
          'Menjaga anak usia 2 tahun',
          'Menyiapkan makanan anak',
          'Membantu aktivitas belajar dan bermain',
        ],
      ),
    ];
  }
}
