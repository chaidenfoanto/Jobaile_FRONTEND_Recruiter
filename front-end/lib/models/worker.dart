class Worker {
  final String id;
  final String name;
  final int age;
  final String imagePath;
  final bool isAsset;
  final double rating;
  final String description;
  final String shortDescription;

  final String location; 
  final String experienceTitle; 
  final String experiencePeriod;
  final List<String> experienceDetails;

  // Constructor that takes all fields
  Worker({
    required this.id,
    required this.name,
    required this.age,
    required this.imagePath,
    this.isAsset = false,
    required this.rating,
    required this.description,
    required this.shortDescription,
    required this.location,
    required this.experienceTitle,
    required this.experiencePeriod,
    required this.experienceDetails,
  });

  // Factory constructor for creating a Worker from simplified data (compatible with worker_model.dart)
  factory Worker.fromSimplified({
    required String image,
    required String name,
    required int age,
    required String description,
    required double rating,
  }) {
    return Worker(
      id: name.hashCode.toString(), // Generate an ID based on name hash
      name: name,
      age: age,
      imagePath: image,
      isAsset: true, // Assuming simplified model always uses asset images
      rating: rating,
      description: description,
      shortDescription: description.length > 80 
          ? description.substring(0, 80) + '...' 
          : description,
      location: 'Indonesia', // Default value
      experienceTitle: 'Asisten Rumah Tangga',
      experiencePeriod: 'Tidak Diketahui',
      experienceDetails: [
        'Pengalaman kerja tidak dirinci',
      ],
    );
  }

  static List<Worker> dummyWorkers = [
    Worker(
      id: '1',
      name: 'Nur Harmawati Kudus',
      age: 28,
      imagePath: 'assets/images/helper_dashboard/helper1.png',
      isAsset: true,
      rating: 4.2,
      shortDescription: 'Berpengalaman lebih dari 3 tahun sebagai ART, terbiasa mengurus anak dan membersihkan rumah secara detail.',
      description:
          'Nur Harmawati adalah ART berpengalaman selama lebih dari 3 tahun. Ia dikenal rajin, jujur, dan sabar dalam mengurus anak-anak serta kebersihan rumah.',
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
      rating: 4.7,
      description: 'Ahli dalam memasak makanan rumahan, rapi dalam pekerjaan, dan sudah terbiasa bekerja dengan keluarga yang memiliki anak kecil dan hewan kelinci.',
      shortDescription: 'Ahli dalam memasak makanan rumahan dan telaten mengurus anak kecil dan hewan peliharaan.',
      location: 'Surabaya, Jawa Timur',
      experienceTitle: 'ART dan Juru Masak',
      experiencePeriod: '2021 - 2023',
      experienceDetails: [
        'Menjaga anak usia 2 tahun',
        'Mengurus anjing Golden Retriever',
        'Membersihkan dan mencuci pakaian',
      ],
    ),
    Worker(
      id: '3',
      name: 'Yuni Lestari',
      age: 25,
      imagePath: 'assets/images/helper_dashboard/helper3.png',
      isAsset: true,
      rating: 4.7,
      shortDescription: 'Telaten dan sabar, cocok untuk menjaga lansia atau anak.',
      description:
          'Yuni adalah ART yang sangat sabar dan perhatian, cocok merawat lansia maupun anak. Ia pernah tinggal dalam dan dipercaya mengelola rumah tangga.',
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
