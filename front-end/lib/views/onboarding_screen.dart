import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '/BLoC/onboarding/onboarding_bloc.dart';
import '/BLoC/onboarding/onboarding_event.dart';
import '/BLoC/onboarding/onboarding_state.dart';
import '/widgets/onboarding_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  void _goToLogin() {
    context.push('/login');
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.height < 600;

    return BlocProvider(
      create: (_) => OnboardingBloc(),
      child: BlocConsumer<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          if (!state.isLoading &&
              state.currentPage == 2 &&
              ModalRoute.of(context)?.isCurrent == true) {
            // tidak melakukan navigasi apapun, kecuali jika kamu ingin show loading/hide loading
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    if (state.currentPage < 2) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (page) {
                      context.read<OnboardingBloc>().add(PageChanged(page));
                    },
                    children: [
                      const OnboardingItem(
                        image: 'assets/animations/housemaid.json',
                        title: 'Pencarian Lebih Mudah',
                        description:
                            'Temukan tenaga kerja rumah tangga yang tepat dan terpercaya tanpa ribet. Cukup melalui Jobaile, semua kebutuhan rumah tangga Anda bisa langsung terbantu.',
                      ),
                      const OnboardingItem(
                        image: 'assets/animations/contract.json',
                        title: 'Aman dan Terjangkau',
                        description:
                            'Sistem kontrak digital menjamin kinerja ART, didukung oleh rating dan ulasan dari pengguna lain. Aman, transparan, dan terpercaya.',
                      ),
                      OnboardingItem(
                        image: 'assets/animations/location.json',
                        title: 'Dekat dan Siap Kerja',
                        description:
                            'Aktifkan lokasi dan temukan ART terdekat yang siap membantu.  Prosesnya cepat, praktis, dan langsung cocok dengan kebutuhanmu.',
                        buttonLabel: 'NYALAKAN LOKASI',
                        onPrimaryPressed: () {
                          context.read<OnboardingBloc>().add(
                            EnableLocationPressed(
                              onSuccessNavigate: () {
                                context.go('/login');
                              },
                            ),
                          );
                        },
                        extraButton: GestureDetector(
                          onTap: () {
                            context.read<OnboardingBloc>().add(SkipPressed());
                            _goToLogin();
                          },
                          child: Text(
                            'Lewati untuk Sekarang',
                            style: GoogleFonts.poppins(
                              fontSize: isSmallScreen ? 13 : 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (state.currentPage < 2)
                  Positioned(
                    bottom: isSmallScreen ? 110 : 130,
                    left: 0,
                    right: 0,
                    child: TextButton(
                      onPressed: () {
                        context.read<OnboardingBloc>().add(SkipPressed());
                        _goToLogin();
                      },
                      child: Text(
                        'Skip',
                        style: GoogleFonts.poppins(
                          fontSize: isSmallScreen ? 14 : 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: isSmallScreen ? 80 : 90,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: isSmallScreen ? 10 : 12,
                        height: isSmallScreen ? 10 : 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: state.currentPage == index
                              ? const Color(0xFF0C3C81)
                              : const Color(0xFFE0E0E0),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
