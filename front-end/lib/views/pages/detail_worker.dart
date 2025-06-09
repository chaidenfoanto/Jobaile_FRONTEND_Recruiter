import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// Menggunakan import sesuai dengan struktur folder yang Anda berikan
import 'package:detail_profil/color/color.dart';
import 'package:detail_profil/BLoC/detail_bloc.dart';
// import '../widgets/star_rating.dart'; // Tidak digunakan karena data rating tidak ada dari API

class WorkerDetailPage extends StatelessWidget {
  final String workerId;

  const WorkerDetailPage({Key? key, required this.workerId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Profil Pekerja',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border, color: Colors.white),
            onPressed: () {
              // TODO: Implementasi logika bookmark
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Bookmark ditambahkan!')),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<WorkerDetailBloc, WorkerDetailState>(
        builder: (context, state) {
          if (state is WorkerDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is WorkerDetailError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          if (state is WorkerDetailLoaded) {
            final worker = state.worker;
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Bagian Foto dan Info Singkat (row)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.network(
                                worker.profilePicture,
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.person, size: 120, color: AppColors.textLight),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    worker.fullName,
                                    style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textDark,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Umur ${worker.age} Tahun',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: AppColors.textLight,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    worker.location,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: AppColors.textLight,
                                    ),
                                  ),
                                  // --- Bagian rating dihapus ---
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Bagian Deskripsi Lengkap (Bio)
                        Text(
                          'Deskripsi',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textDark,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          worker.bio,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: AppColors.textDark,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Bagian Pengalaman (disesuaikan)
                        Text(
                          'Pengalaman',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textDark,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Menggunakan experienceYears untuk membuat kalimat sederhana
                        Text(
                          '${worker.experienceYears} Tahun Pengalaman.',
                          // Atau jika Anda ingin lebih detail dan teks pengalaman ada di bio:
                          // 'Bekerja selama ${worker.experienceYears} tahun, termasuk membantu merawat lansia, menjaga kebersihan, dll.'
                          // (Ini hanya contoh, Anda perlu menentukan teks ini dari mana)
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: AppColors.textDark,
                            height: 1.5,
                          ),
                        ),
                        // --- Bagian bullet point experienceDetails dihapus ---
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
                // Tombol Aksi di bagian bawah
                _buildBottomActionButtons(context),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  // --- HELPER WIDGETS ---

  // _buildStarRating dihapus karena tidak ada rating

  Widget _buildBottomActionButtons(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.shade200, width: 1.0),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implementasi logika untuk ulasan
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Melihat ulasan...')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: AppColors.primary),
                ),
                elevation: 0,
              ),
              child: Text(
                'Ulasan',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implementasi logika untuk menghubungi pekerja
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Menghubungi pekerja...')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Kontak ART',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}