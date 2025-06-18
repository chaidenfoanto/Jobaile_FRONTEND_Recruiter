import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '/color/color.dart';
import '/models/worker.dart';

class WorkerProfilePage extends StatelessWidget {
  final Worker worker;

  const WorkerProfilePage({super.key, required this.worker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // Custom AppBar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 60,
              color: AppColors.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  Text(
                    'Profil Pekerja',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Icon(Icons.bookmark_border, color: Colors.white),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Header
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: worker.imagePath.isNotEmpty
                              ? Image(
                                  image: worker.isAsset
                                      ? AssetImage(worker.imagePath)
                                      : NetworkImage(worker.imagePath) as ImageProvider,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  width: 100,
                                  height: 100,
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.person, size: 40),
                                ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                worker.name,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Umur ${worker.age} Tahun',
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              Text(
                                worker.location,
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  ...List.generate(5, (i) {
                                    double rating = worker.rating;
                                    if (i < rating.floor()) {
                                      return const Icon(Icons.star, color: Colors.amber, size: 16);
                                    } else if (i < rating) {
                                      double partial = rating - i;
                                      return Stack(
                                        children: [
                                          Icon(Icons.star, color: Colors.grey.shade300, size: 16),
                                          ClipRect(
                                            clipper: _PartialClipper(partial),
                                            child: const Icon(Icons.star, color: Colors.amber, size: 16),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return Icon(Icons.star, color: Colors.grey.shade300, size: 16);
                                    }
                                  }),
                                  const SizedBox(width: 4),
                                  Text(worker.rating.toStringAsFixed(1), style: GoogleFonts.poppins(fontSize: 12)),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Deskripsi
                    Text(
                      'Deskripsi',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Divider(height: 20),
                    Text(
                      worker.description,
                      style: GoogleFonts.poppins(fontSize: 13),
                    ),

                    const SizedBox(height: 24),

                    // Pengalaman
                    Text(
                      'Pengalaman',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Divider(height: 20),
                    Text(
                      worker.experienceTitle,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      worker.experiencePeriod,
                      style: GoogleFonts.poppins(),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: worker.experienceDetails
                          .map((item) => BulletText(item))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Buttons - styled to match discovery page
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Tombol Ulasan
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Fitur ulasan belum tersedia.")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(160, 37),
                        backgroundColor: const Color(0xFFB9E6FF),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              'Ulasan',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Icon(Icons.chevron_right, size: 16),
                        ],
                      ),
                    ),

                    // Spacer
                    const SizedBox(width: 10),

                    // Tombol Kontak ART
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Menghubungi ${worker.name}...")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(160, 37),
                        backgroundColor: const Color(0xFFB9FFBA),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              'Kontak ART',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Icon(Icons.chat, size: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BulletText extends StatelessWidget {
  final String text;
  const BulletText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 14)),
          Expanded(child: Text(text, style: GoogleFonts.poppins(fontSize: 13))),
        ],
      ),
    );
  }
}

class _PartialClipper extends CustomClipper<Rect> {
  final double fraction;

  _PartialClipper(this.fraction);

  @override
  Rect getClip(Size size) => Rect.fromLTWH(0, 0, size.width * fraction, size.height);

  @override
  bool shouldReclip(_PartialClipper oldClipper) => oldClipper.fraction != fraction;
}
