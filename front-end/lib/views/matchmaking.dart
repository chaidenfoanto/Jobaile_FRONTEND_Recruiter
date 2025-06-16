import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_match/BLoC/matchbloc/worker_bloc.dart';
import 'package:instant_match/models/worker.dart';

class WorkerDiscoveryPage extends StatelessWidget {
  const WorkerDiscoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              // Back button with shadow on corners
              Positioned(
                top: 48,
                left: 21,
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.10),
                        blurRadius: 16,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: SvgPicture.asset(
                      'assets/foto/arrow_only.svg',
                      width: 28,
                      height: 28,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // Centered title
              Positioned(
                top: 53,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'Instant Match!',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: BlocBuilder<WorkerBloc, WorkerState>(
          builder: (context, state) {
            if (state is WorkerLoading) {
              return const CircularProgressIndicator();
            } else if (state is WorkerLoaded) {
              return _buildWorkerCard(context, state.currentWorker);
            } else if (state is WorkerError) {
              return Text('Error: ${state.message}');
            } else {
              return const Text('Tekan tombol untuk mencari ART.');
            }
          },
        ),
      ),
    );
  }

  Widget _buildWorkerCard(BuildContext context, Worker worker) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 4.0, left: 16, right: 16, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Gambar tengah
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  worker.imageUrl,
                  fit: BoxFit.cover,
                  height: 424,
                  width: 350,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 424,
                      width: 350,
                      color: Colors.grey[300],
                      child: Center(
                        child: Icon(Icons.person, size: 80, color: Colors.grey[600]),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 20), // naikkan teks lebih dekat ke image

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama dan usia
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      worker.name,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '${worker.age} Tahun',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Rating
                Row(
                  children: [
                    for (int i = 0; i < 4; i++)
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                    const Icon(Icons.star_half, color: Colors.amber, size: 20),
                    const SizedBox(width: 6),
                    Text(
                      '4.7',
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Short description
                Text(
                  worker.shortDescription,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // Tombol aksi
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/workerDetail', arguments: worker);
                },
                icon: const Icon(Icons.person),
                label: Text(
                  'Lihat Profil',
                  style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue.shade100,
                  foregroundColor: Colors.blue.shade900,
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  context.read<WorkerBloc>().add(LoadNextWorkerEvent());
                },
                icon: const Icon(Icons.arrow_forward),
                label: Text(
                  'Selanjutnya',
                  style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFC1CC),
                  foregroundColor: Colors.pink.shade900,
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
