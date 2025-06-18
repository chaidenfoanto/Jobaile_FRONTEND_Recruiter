import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OnboardingItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String? buttonLabel;
  final VoidCallback? onPrimaryPressed;
  final Widget? extraButton;

  const OnboardingItem({super.key, 
    required this.image,
    required this.title,
    required this.description,
    this.buttonLabel,
    this.onPrimaryPressed,
    this.extraButton,
  });

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.height < 600;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 36.0 : 40.0,
        vertical: isSmallScreen ? 50 : 70,
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          SizedBox(
            height: isSmallScreen ? 200 : 300,
            child: Lottie.asset(image),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: isSmallScreen ? 20 : 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: isSmallScreen ? 13 : 15,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          if (buttonLabel != null && onPrimaryPressed != null)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: onPrimaryPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0C3C81),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                  child: Text(
                    buttonLabel!,
                    style: GoogleFonts.poppins(
                      fontSize: isSmallScreen ? 15 : 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          if (extraButton != null) ...[
            const SizedBox(height: 15),
            extraButton!,
          ]
        ],
      ),
    );
  }
}
