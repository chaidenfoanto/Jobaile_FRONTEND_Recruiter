class Worker {
  final String id;
  final String name;
  final int age;
  final String imageUrl;
  final double rating; // Tambahkan ini
  final String description;
  final String experience;
  final String shortDescription;

  Worker({
    required this.id,
    required this.name,
    required this.age,
    required this.imageUrl,
    required this.rating, // Tambahkan ini juga
    this.description =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    this.experience = '2 Tahun pengalaman kerja sebagai ART.',
    this.shortDescription = 'Seorang ART yang rajin dan berpengalaman.',
  });

  // Dummy data untuk simulasi
  static List<Worker> dummyWorkers = [
    Worker(
      id: '1',
      name: 'Budi Santoso',
      age: 28,
      imageUrl: 'https://images.unsplash.com/photo-1507003211169-e61eed18fe40?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      shortDescription: 'Berpengalaman merawat balita dengan penuh kasih sayang dan terbiasa mengurus hewan peliharaan, terutama anjing. Telaten, sabar, dan mencintai pekerjaannya.',
      rating: 4.5,
    ),
    Worker(
      id: '2',
      name: 'Siti Aminah',
      age: 35,
      imageUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      shortDescription: 'Berpengalaman merawat balita dengan penuh kasih sayang dan terbiasa mengurus hewan peliharaan, terutama anjing. Telaten, sabar, dan mencintai pekerjaannya.',
      rating: 4.7,
    ),
    Worker(
      id: '3',
      name: 'Agus Wijaya',
      age: 25,
      imageUrl: 'https://images.unsplash.com/photo-1521119989691-8d0705973719?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      shortDescription: 'Berpengalaman merawat balita dengan penuh kasih sayang dan terbiasa mengurus hewan peliharaan, terutama anjing. Telaten, sabar, dan mencintai pekerjaannya.',
      rating: 4.3,
    ),
    Worker(
      id: '4',
      name: 'Dewi Lestari',
      age: 30,
      imageUrl: 'https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=1961&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      shortDescription: 'Berpengalaman merawat balita dengan penuh kasih sayang dan terbiasa mengurus hewan peliharaan, terutama anjing. Telaten, sabar, dan mencintai pekerjaannya.',
      rating: 4.8,
    ),
    Worker(
      id: '5',
      name: 'Joko Prabowo',
      age: 40,
      imageUrl: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      shortDescription: 'Berpengalaman merawat balita dengan penuh kasih sayang dan terbiasa mengurus hewan peliharaan, terutama anjing. Telaten, sabar, dan mencintai pekerjaannya.',
      rating: 4.6,
    ),
  ];
}
