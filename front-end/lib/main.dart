import 'package:flutter/material.dart';
import 'package:profile/views/pages/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      home: ProfilePage(),
    );
  }
}