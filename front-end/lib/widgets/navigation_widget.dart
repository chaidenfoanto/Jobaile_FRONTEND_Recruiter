import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '/color/color.dart';
import '/cubit/navigation_cubit.dart';
import '/views/dashboard.dart';
import '/views/matchmaking.dart';
import '/views/chat.dart';
import '/views/profile.dart';

class NavigationWidget extends StatelessWidget {
  final Map<NavigationItem, Widget> pages = {
    NavigationItem.home: DashboardScreen(),
    NavigationItem.match: MatchmakingScreen(),
    NavigationItem.chat: ChatScreen(),
    NavigationItem.profile: ProfileScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationCubit, NavigationItem>(
        builder: (context, state) {
          return pages[state] ?? Center(child: Text('Not Found'));
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationItem>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: NavigationItem.values.indexOf(state),
            onTap: (index) {
              context.read<NavigationCubit>().updateIndex(NavigationItem.values[index]);
            },
            iconSize: 28.0, // ⬅️ Icon diperbesar
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.secondary,
            selectedLabelStyle: GoogleFonts.poppins(
              fontSize: 6.0,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
            unselectedLabelStyle: GoogleFonts.poppins(
              fontSize: 6.0,
              fontWeight: FontWeight.w500,
              color: AppColors.secondary,
            ),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/home.svg')),
                activeIcon: ImageIcon(AssetImage('assets/icons/home_active.svg')),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/matching.svg')),
                activeIcon: ImageIcon(AssetImage('assets/icons/matching_active.svg')),
                label: 'Match',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/chat.svg')),
                activeIcon: ImageIcon(AssetImage('assets/icons/chat_active.svg')),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/profile.svg')),
                activeIcon: ImageIcon(AssetImage('assets/icons/profile_active.svg')),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
