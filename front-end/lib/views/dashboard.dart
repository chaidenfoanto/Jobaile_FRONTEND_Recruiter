import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> helpers = [
    {
      'name': 'Nur Harmawati Kudus',
      'age': 28,
      'description':
          'Berpengalaman lebih dari 3 tahun sebagai ART, terbiasa mengurus dan membersihkan rumah secara detail. Ramah dan disiplin dalam bekerja.',
      'image': 'assets/images/helper1.jpg',
      'rating': 4,
    },
    {
      'name': 'Siti Komariah',
      'age': 55,
      'description':
          'Ahli dalam memasak makanan rumahan, rapi dalam pekerjaan, dan sudah terbiasa bekerja dengan keluarga yang memiliki anak kecil dan hewan kelinci.',
      'image': 'assets/images/helper2.jpg',
      'rating': 4,
    },
    {
      'name': 'Yuni Lestari',
      'age': 31,
      'description':
          'Telaten dan sabar, cocok untuk menjaga lansia atau anak. Pernah bekerja sebagai ART tinggal dalam selama 2 tahun di Mks.',
      'image': 'assets/images/helper3.jpg',
      'rating': 4,
    },
    {
      'name': 'Kiran Natasya Kenta',
      'age': 19,
      'description':
          'Berpengalaman merawat balita dengan penuh kasih dan perhatian. Terlatih dalam kebersihan serta disiplin waktu.',
      'image': 'assets/images/helper4.jpg',
      'rating': 4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return SafeArea(
      child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            color: const Color(0xFF0C3C81),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Temukan Asistenmu!',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            items: [
                              DropdownMenuItem(
                                value: 'ART',
                                child: Text('Asisten Rumah Tangga',
                                    style: GoogleFonts.poppins(fontSize: 12)),
                              ),
                            ],
                            onChanged: (val) {},
                            value: 'ART',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            items: [
                              DropdownMenuItem(
                                value: 'Makassar',
                                child: Text('Makassar, Sulawesi Selatan',
                                    style: GoogleFonts.poppins(fontSize: 12)),
                              ),
                            ],
                            onChanged: (val) {},
                            value: 'Makassar',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.search, color: Color(0xFF0C3C81)),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // List of helpers
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: helpers.length,
              separatorBuilder: (_, __) =>
                  const Divider(thickness: 1, height: 24),
              itemBuilder: (context, index) {
                final helper = helpers[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          helper['image'],
                          width: 72,
                          height: 72,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${helper['name']}',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${helper['age']} Tahun',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              helper['description'],
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(fontSize: 12),
                            ),
                            const SizedBox(height: 8),

                            // Rating & Button
                            Row(
                              children: [
                                Row(
                                  children: List.generate(5, (i) {
                                    return Icon(
                                      Icons.star,
                                      color: i < helper['rating']
                                          ? Colors.amber
                                          : Colors.grey[300],
                                      size: 16,
                                    );
                                  }),
                                ),
                                const Spacer(),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFB5E3F7),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Lihat Selengkapnya',
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
