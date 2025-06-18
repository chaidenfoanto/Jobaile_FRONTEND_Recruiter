import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '/BLoC/profile/profile_event.dart';
import '/BLoC/profile/profile_state.dart';
import '/BLoC/profile/profile_bloc.dart';
import '/color/color.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(LoadProfile()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(393, 70), // Set ukuran W: 393, H: 105
          child: AppBar(
            backgroundColor: AppColors.primary,
            elevation: 0,
            flexibleSpace: Container(
              width: 393,
              height: 70,
              padding: EdgeInsets.only(top: 15, left: 16, right: 16),
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
                    icon: Icon(Icons.notifications_none, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40), // Corner radius: 40
                      child: Image.asset( // <-- UBAH DI SINI: Image.network menjadi Image.asset
                        'assets/images/Julia.png', // <-- Path ke gambar aset Anda
                        width: 143,
                        height: 143,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      state.user.name,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      state.user.phoneNumber,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 30),
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
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.email_outlined, size: 24),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "E-mail address",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    state.user.email,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Divider(thickness: 1, color: Colors.grey.shade300),
                          buildListItem(Icons.bookmark, "Pekerja Favorit"),
                          Divider(thickness: 1, color: Colors.grey.shade300),
                          buildListItem(Icons.assignment, "Syarat & Ketentuan"),
                          Divider(thickness: 1, color: Colors.grey.shade300),
                          buildListItem(Icons.contact_phone, "Hubungi Kami"),
                          Divider(thickness: 1, color: Colors.grey.shade300),
                          buildListItem(Icons.logout, "Keluar", onTap: () {
                            // Navigasi ke halaman login
                            context.go('/login');
                          }),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Center(child: Text('Gagal memuat profil'));
            }
          },
        ),
      ),
    );
  }

  Widget buildListItem(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black, size: 28),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
