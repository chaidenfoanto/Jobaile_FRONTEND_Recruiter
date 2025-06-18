// main.dart
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'app.dart';

void main() => runApp(const Jobaile());
=======
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
>>>>>>> profile
