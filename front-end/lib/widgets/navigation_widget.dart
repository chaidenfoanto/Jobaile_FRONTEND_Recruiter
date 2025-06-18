import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '/color/color.dart';
import '../BLoC/navigation/navigation_cubit.dart';
import '/views/dashboard.dart';
import '/views/matchmaking.dart';
import '../views/chat/chat.dart';
import '/views/profile.dart';

class NavigationWidget extends StatelessWidget {
  final Map<NavigationItem, Widget> pages = {
    NavigationItem.home: DashboardScreen(),
    NavigationItem.match: MatchmakingScreen(),
    NavigationItem.chat: ChatScreen(),
    NavigationItem.profile: ProfileScreen(),
  };

  final Widget child;

  NavigationWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BlocBuilder<NavigationCubit, NavigationItem>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: NavigationItem.values.indexOf(state),
              onTap: (index) {
                final navigationItem = NavigationItem.values[index];
                context.read<NavigationCubit>().updateIndex(navigationItem);
                
                // Navigate to the appropriate route
                switch (navigationItem) {
                  case NavigationItem.home:
                    GoRouter.of(context).go('/main/home');
                    break;
                  case NavigationItem.match:
                    GoRouter.of(context).push('/main/matchmaking');
                    break;
                  case NavigationItem.chat:
                    GoRouter.of(context).go('/main/chat');
                    break;
                  case NavigationItem.profile:
                    GoRouter.of(context).go('/main/profile');
                    break;
                }
              },
              iconSize: 0, // dikontrol manual
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.primary,
              selectedLabelStyle: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
              unselectedLabelStyle: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/icons/home.svg', width: 24, height: 24),
                        SizedBox(height: 4),
                      ],
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/icons/home_active.svg', width: 24, height: 24),
                        SizedBox(height: 4),
                      ],
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/icons/matching.svg', width: 24, height: 24),
                        SizedBox(height: 4),
                      ],
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/icons/matching_active.svg', width: 24, height: 24),
                        SizedBox(height: 4),
                      ],
                    ),
                  ),
                  label: 'Match',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/icons/chat.svg', width: 24, height: 24),
                        SizedBox(height: 4),
                      ],
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/icons/chat_active.svg', width: 24, height: 24),
                        SizedBox(height: 4),
                      ],
                    ),
                  ),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/icons/profile.svg', width: 24, height: 24),
                        SizedBox(height: 4),
                      ],
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/icons/profile_active.svg', width: 24, height: 24),
                        SizedBox(height: 4),
                      ],
                    ),
                  ),
                  label: 'Profile',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
