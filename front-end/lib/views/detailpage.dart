// pages/worker_detail_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/worker.dart';

class WorkerDetailPage extends StatelessWidget {
  final Worker worker;

  const WorkerDetailPage({super.key, required this.worker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil ${worker.name}',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: 'worker_image_${worker.id}', // Tag unik untuk Hero animation
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(worker.imageUrl),
                  onBackgroundImageError: (exception, stackTrace) {
                    // Handle error if image fails to load
                    debugPrint('Error loading image: $exception');
                  },
                  child: worker.imageUrl.isEmpty // Fallback for no image
                      ? const Icon(Icons.person, size: 80, color: Colors.white)
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '${worker.name}, ${worker.age} Tahun',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const Divider(height: 30, thickness: 1),
            _buildDetailRow(
              icon: Icons.info_outline,
              label: 'Tentang Saya:',
              value: worker.description,
            ),
            _buildDetailRow(
              icon: Icons.work_outline,
              label: 'Pengalaman:',
              value: worker.experience,
            ),
            // Tambahkan detail dummy lainnya di sini sesuai kebutuhan UI
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Contoh aksi: chat atau panggil
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Menghubungi ${worker.name}...')),
                  );
                },
                icon: const Icon(Icons.message),
                label: Text(
                  'Hubungi Sekarang',
                  style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 7,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({required IconData icon, required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blue.shade700, size: 24),
              const SizedBox(width: 10),
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 34.0),
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}