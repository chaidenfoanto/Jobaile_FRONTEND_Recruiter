import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../cubit/navigation_cubit.dart';
import 'package:navigation/views/pages/homepage.dart';
import 'package:navigation/views/pages/match.dart';
import 'package:navigation/views/pages/chat.dart';
import 'package:navigation/views/pages/profile.dart';
import 'package:navigation/color/color.dart';

class NavigationWidget extends StatelessWidget {
  final Map<NavigationItem, Widget> pages = {
    NavigationItem.home: HomePage(),
    NavigationItem.match: MatchPage(),
    NavigationItem.chat: ChatPage(),
    NavigationItem.profile: ProfilePage(),
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
                icon: ImageIcon(AssetImage('assets/foto/Home.png')),
                activeIcon: ImageIcon(AssetImage('assets/foto/Home_active.png')),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/foto/Matching.png')),
                activeIcon: ImageIcon(AssetImage('assets/foto/Matching_active.png')),
                label: 'Match',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/foto/Chat.png')),
                activeIcon: ImageIcon(AssetImage('assets/foto/Chat_active.png')),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/foto/Profile.png')),
                activeIcon: ImageIcon(AssetImage('assets/foto/Profile_active.png')),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
