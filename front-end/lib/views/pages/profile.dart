import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile/BLoC/profile_bloc.dart';
import 'package:profile/BLoC/profile_event.dart';
import 'package:profile/BLoC/profile_state.dart';

class ProfilePage extends StatelessWidget {
  final VoidCallback? onNotificationPressed;

  const ProfilePage({Key? key, this.onNotificationPressed}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(LoadProfile()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size(393, 105),
          child: AppBar(
            backgroundColor: const Color(0xFF0B4C86),
            elevation: 0,
            flexibleSpace: Container(
              width: 393,
              height: 105,
              padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profil',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    key: const Key('notification_button'),
                    icon: const Icon(Icons.notifications_none, color: Colors.white),
                    onPressed: onNotificationPressed ?? () {},
                  ),
                ],
              ),
            ),
          ),
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        'assets/foto/foto.png',
                        width: 143,
                        height: 143,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      state.user.name,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      state.user.phoneNumber,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "E-mail",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.email_outlined, size: 24),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "E-mail address",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    state.user.email,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          const Divider(),
                          buildListItem(Icons.bookmark, "Pekerja Favorit"),
                          const Divider(),
                          buildListItem(Icons.assignment, "Terms & Conditions"),
                          const Divider(),
                          buildListItem(Icons.contact_phone, "Contact us"),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const Center(child: Text('Gagal memuat profil'));
            }
          },
        ),
      ),
    );
  }

  Widget buildListItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black, size: 28),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
