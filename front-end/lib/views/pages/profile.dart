import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/profile_bloc.dart';
import '../blocs/profile_event.dart';
import '../blocs/profile_state.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(LoadProfile()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profil'),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // TODO: Handle notification action
              },
            ),
          ],
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      // Replace with your profile image URL or asset
                      backgroundImage: NetworkImage('https://your-image-url.com'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      state.user.name,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      state.user.phoneNumber,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    Text('E-mail'),
                    SizedBox(height: 5),
                    Text(
                      state.user.email,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      leading: Icon(Icons.bookmark),
                      title: Text('Pekerja Favorit'),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                    ListTile(
                      leading: Icon(Icons.assignment),
                      title: Text('Terms & Conditions'),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                    ListTile(
                      leading: Icon(Icons.contact_phone),
                      title: Text('Contact us'),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              );
            }
            return Center(child: Text('Error loading profile'));
          },
        ),
      ),
    );
  }
}