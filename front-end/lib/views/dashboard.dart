import 'package:flutter/material.dart';
import 'package:login/color/color.dart';

class DashboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> helpers = [
    {
      'image': 'assets/images/helper1.png',
      'name': 'Nur Harmawati Kudus',
      'age': 28,
      'description':
          'Berpengalaman lebih dari 3 tahun sebagai ART, terbiasa mengurus dan membersihkan rumah secara detail. Ramah dan disiplin dalam bekerja.',
      'rating': 4.5
    },
    {
      'image': 'assets/images/helper2.png',
      'name': 'Siti Komariah',
      'age': 55,
      'description':
          'Ahli dalam memasak makanan rumahan, rapi dalam pekerjaan, dan sudah terbiasa bekerja dengan keluarga yang memiliki anak kecil dan hewan kelinci.',
      'rating': 4
    },
    {
      'image': 'assets/images/helper3.png',
      'name': 'Yuni Lestari',
      'age': 31,
      'description':
          'Telaten dan sabar, cocok untuk menjaga lansia atau anak. Pernah bekerja sebagai ART tinggal dalam selama 2 tahun di Mks.',
      'rating': 4
    },
    {
      'image': 'assets/images/helper4.png',
      'name': 'Kiran Natasya Kenta',
      'age': 19,
      'description':
          'Berpengalaman merawat balita dengan telaten dan sabar. Terbiasa mengikuti jadwal dan disiplin waktu.',
      'rating': 3
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              decoration: BoxDecoration(
              color: AppColors.primary,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 12,
                  spreadRadius: 1,
                  offset: const Offset(0, 6), // arah bawah
                ),
              ],
            ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Temukan Asistenmu!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(Icons.search, color: AppColors.primary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      // Dropdown Kategori
                      Expanded(
                        child: Container(
                          height: 34,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.person_outline, size: 20),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Asisten Rumah Tangga',
                                  style: TextStyle(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Dropdown Lokasi
                      Expanded(
                        child: Container(
                          height: 34,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.location_on_outlined, size: 20),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Makassar, Sulawesi Selatan',
                                  style: TextStyle(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Daftar ART
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                itemCount: helpers.length,
                separatorBuilder: (_, __) => const Divider(
                  color: Color(0xFFD9D9D9),
                  thickness: 2,
                  height: 28,
                ),
                itemBuilder: (context, index) {
                  final item = helpers[index];

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.25,
                            child: AspectRatio(
                              aspectRatio: 4 / 5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  item['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: List.generate(5, (i) {
                              double rating = item['rating'].toDouble();
                              if (i < rating.floor()) {
                                // Penuh
                                return const Icon(Icons.star, color: Colors.amber, size: 16);
                              } else if (i < rating) {
                                // Parsial
                                double partial = rating - i;
                                return Stack(
                                  children: [
                                    Icon(Icons.star, color: Colors.grey.shade300, size: 16),
                                    ClipRect(
                                      clipper: PartialClipper(partial),
                                      child: const Icon(Icons.star, color: Colors.amber, size: 16),
                                    ),
                                  ],
                                );
                              } else {
                                // Kosong
                                return Icon(Icons.star, color: Colors.grey.shade300, size: 16);
                              }
                            }),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: const TextStyle(
                                fontSize: 15.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text('${item['age']} Tahun', style: const TextStyle(fontSize: 13)),
                            const SizedBox(height: 6),
                            Text(
                              item['description'],
                              style: const TextStyle(fontSize: 13, height: 1.4),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 12),
                            Container(
                              height: 28,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 3,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: AppColors.secondary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                                child: const Text(
                                  'Lihat Selengkapnya',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.5,
                                    color: Colors.black,
                                  ),
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
      ),
    );
  }
}

class PartialClipper extends CustomClipper<Rect> {
  final double fraction;

  PartialClipper(this.fraction);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width * fraction, size.height);
  }

  @override
  bool shouldReclip(PartialClipper oldClipper) =>
      oldClipper.fraction != fraction;
}
