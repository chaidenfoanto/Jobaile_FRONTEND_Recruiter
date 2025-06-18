// lib/widgets/dashboard/helper_card.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/worker.dart';
import '../../color/color.dart';

class WorkerCard extends StatelessWidget {
  final Worker worker;

  const WorkerCard({super.key, required this.worker});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        // Navigate to detail page when the entire card is tapped using Go Router
        context.go('/main/home/worker/${worker.id}', extra: worker);
      },
      child: Row(
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
                      worker.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: List.generate(5, (i) {
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
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(worker.name, style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text('${worker.age} Tahun', style: const TextStyle(fontSize: 13)),
                const SizedBox(height: 6),
                Text(worker.description,
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
                    onPressed: () {
                      // Navigate to detail page when button is clicked using Go Router
                      context.go('/main/home/worker/${worker.id}', extra: worker);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text(
                      'Lihat Selengkapnya',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5, color: Colors.black),
                    ),
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
