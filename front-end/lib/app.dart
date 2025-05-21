import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'splash_screen.dart';
// import 'onboarding_screen.dart';
import 'login.dart';
// import 'register.dart';
// import 'dashboard_screen.dart';

class Jobaile extends StatefulWidget {
  const Jobaile({super.key});

  @override
  _JobaileAppState createState() => _JobaileAppState();
}

class _JobaileAppState extends State<Jobaile> {
  late Future<String> _initialScreen;

  // Future<String> _determineInitialScreen() async {
  //   final prefs = await SharedPreferences.getInstance();

  //   // Cek apakah aplikasi pertama kali dibuka
  //   bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

  //   if (isFirstLaunch) {
  //     await prefs.setBool('isFirstLaunch', false);
  //     return 'splash'; // Arahkan ke SplashScreen dulu
  //   }

  //   // Cek status login
  //   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  //   if (isLoggedIn) {
  //     return 'dashboard';
  //   } else {
  //     return 'login';
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _initialScreen = _determineInitialScreen();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jobaile',
      theme: ThemeData(
        primaryColor: const Color(0xFFFECE2E),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ),
      home: FutureBuilder<String>(
        future: _initialScreen,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // return const SplashScreen(); // Sementara menunggu data, tampilkan splash
          } else if (snapshot.hasData) {
            switch (snapshot.data) {
              case 'splash':
                // return const SplashScreen();
              case 'dashboard':
                // return const DashboardScreen();
              case 'login':
              default:
                return const LoginScreen();
            }
          } else {
            return const LoginScreen(); // fallback jika snapshot error
          }
        },
      ),
      routes: {
        // '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        // '/register': (context) => const RegisterScreen(),
        // '/dashboard': (context) => const DashboardScreen(),
      },
    );
  }
}
