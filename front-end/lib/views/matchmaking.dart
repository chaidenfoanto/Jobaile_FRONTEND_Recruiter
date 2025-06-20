import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../BLoC/matchmaking/matchmaking_bloc.dart';
import '../BLoC/navigation/navigation_cubit.dart';
import '/models/worker.dart';
import '/views/detailpage.dart'; 

class MatchmakingScreen extends StatelessWidget {
  const MatchmakingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.read<WorkerBloc>().state is WorkerInitial) {
        context.read<WorkerBloc>().add(LoadInitialWorkerEvent());
      }
    });
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              // Tombol back
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
                    onPressed: () {
                      final navCubit = context.read<NavigationCubit>();
                      navCubit.updateIndex(navCubit.previousItem);
                      context.pop();
                    }, 
                    icon: SvgPicture.asset(
                      'assets/images/arrow_only.svg',
                      width: 28,
                      height: 28,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // Judul
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
    const double desiredButtonWidth = 160.0;
    const double buttonHeight = 37.0;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 0.0, left: 16, right: 16, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Gambar
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: worker.isAsset
                    ? Image.asset(
                        worker.imagePath,
                        fit: BoxFit.cover,
                        height: 424,
                        width: 350,
                      )
                    : Image.network(
                        worker.imagePath,
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
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama dan umur
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
                    ...List.generate(5, (i) {
                      double rating = worker.rating;
                      if (i < rating.floor()) {
                        return const Icon(Icons.star, color: Colors.amber, size: 20);
                      } else if (i < rating) {
                        double partial = rating - i;
                        return Stack(
                          children: [
                            Icon(Icons.star, color: Colors.grey.shade300, size: 20),
                            ClipRect(
                              clipper: _PartialClipper(partial),
                              child: const Icon(Icons.star, color: Colors.amber, size: 20),
                            ),
                          ],
                        );
                      } else {
                        return Icon(Icons.star, color: Colors.grey.shade300, size: 20);
                      }
                    }),
                    const SizedBox(width: 6),
                    Text(
                      worker.rating.toStringAsFixed(1),
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Deskripsi singkat
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

          // Tombol
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Tombol lihat profil
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WorkerProfilePage(worker: worker),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(desiredButtonWidth, buttonHeight),
                    backgroundColor: Colors.lightBlue.shade100,
                    foregroundColor: Colors.blue.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          'Lihat Profil',
                          style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.person, size: 20),
                    ],
                  ),
                ),

                // Tombol selanjutnya
                ElevatedButton(
                  onPressed: () {
                    context.read<WorkerBloc>().add(LoadNextWorkerEvent());
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(desiredButtonWidth, buttonHeight),
                    backgroundColor: const Color(0xFFFFC1CC),
                    foregroundColor: Colors.pink.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          'Selanjutnya',
                          style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.arrow_forward, size: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
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