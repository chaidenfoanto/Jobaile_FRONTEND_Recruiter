import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String selectedCategory = 'Asisten Rumah Tangga';
  String selectedLocation = 'Makassar, Sulawesi Selatan';

  final List<Map<String, dynamic>> assistants = [
    {
      'name': 'Nur Harmawati Kudus',
      'age': 28,
      'description':
          'Berpengalaman lebih dari 3 tahun sebagai ART, terbiasa mengurus dan membersihkan rumah secara detail. Ramah dan disiplin dalam bekerja.',
      'image': 'https://i.imgur.com/WJgStGL.png', // Ganti dengan asset lokal jika ada
      'rating': 4
    },
    {
      'name': 'Siti Komariah',
      'age': 55,
      'description':
          'Ahli dalam memasak makanan rumahan, rapi dalam pekerjaan, dan sudah terbiasa bekerja dengan keluarga yang memiliki anak kecil dan hewan peliharaan.',
      'image': 'https://i.imgur.com/ImA0PSU.png',
      'rating': 4
    },
    {
      'name': 'Yuni Lestari',
      'age': 31,
      'description':
          'Telaten dan sabar, cocok untuk menjaga lansia atau anak. Pernah bekerja sebagai ART tinggal dalam selama 2 tahun di Mks.',
      'image': 'https://i.imgur.com/W5Z6T6v.png',
      'rating': 4
    },
    {
      'name': 'Kiran Natasya Kenta',
      'age': 19,
      'description':
          'Berpengalaman merawat balita dengan penuh kasih dan perhatian.',
      'image': 'https://i.imgur.com/YHb7gUY.png',
      'rating': 4
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: const BoxDecoration(
              color: Color(0xFF0C3C81),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Temukan Asistenmu!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: selectedCategory,
                          icon: const Icon(Icons.arrow_drop_down),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          items: ['Asisten Rumah Tangga', 'Pengasuh Anak', 'Perawat Lansia']
                              .map((label) => DropdownMenuItem(
                                    value: label,
                                    child: Text(label),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: selectedLocation,
                          icon: const Icon(Icons.arrow_drop_down),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          items: ['Makassar, Sulawesi Selatan', 'Jakarta', 'Bandung']
                              .map((label) => DropdownMenuItem(
                                    value: label,
                                    child: Text(label),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedLocation = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              separatorBuilder: (_, __) => const Divider(height: 32),
              itemCount: assistants.length,
              itemBuilder: (context, index) {
                final assistant = assistants[index];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        assistant['image'],
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${assistant['name']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            '${assistant['age']} Tahun',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            assistant['description'],
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: List.generate(5, (star) {
                              return Icon(
                                Icons.star,
                                size: 16,
                                color: star < assistant['rating'] ? Colors.amber : Colors.grey[300],
                              );
                            }),
                          ),
                          const SizedBox(height: 6),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB8EBFF),
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            ),
                            child: const Text(
                              'Lihat Selengkapnya',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF0C3C81),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Match'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
