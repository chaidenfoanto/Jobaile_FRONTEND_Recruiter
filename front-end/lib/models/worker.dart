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

  static List<Worker> dummyWorkers = [
    Worker(
      id: '1',
      name: 'Nur Harmawati Kudus',
      age: 28,
      imagePath: 'assets/foto/nur.png',
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
      name: 'Kiran Natasya Kenta',
      age: 19,
      imagePath: 'assets/foto/kiran.png',
      isAsset: true,
      rating: 4.7,
      shortDescription: 'Berpengalaman merawat balita dan hewan peliharaan, terutama anjing.',
      description:
          'Kiran sangat telaten dalam merawat anak kecil dan menyayangi hewan peliharaan. Ia mudah beradaptasi dan memiliki semangat kerja tinggi.',
      location: 'Bandung, Jawa Barat',
      experienceTitle: 'ART dan Babysitter',
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
      imagePath: 'assets/foto/yuni.png',
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
  ];
}
