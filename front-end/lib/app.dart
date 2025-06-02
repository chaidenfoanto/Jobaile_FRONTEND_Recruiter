import 'package:flutter/material.dart';

import 'splash_screen.dart';
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
  // late Future<String> _initialScreen;

  // Future<String> _determineInitialScreen() async {
  //   final prefs = await SharedPreferences.getInstance();

  //   bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
  //   if (isFirstLaunch) {
  //     await prefs.setBool('isFirstLaunch', false);
  //     return 'splash';
  //   }

  //   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  //   return isLoggedIn ? 'dashboard' : 'login';
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
        fontFamily: 'Poppins',
        primaryColor: const Color(0xFF0C3C81), // Navy Blue
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF0C3C81),
          secondary: const Color(0xFF93E0FF), // Light Blue
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 57,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          displayMedium: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          displaySmall: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headlineLarge: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          headlineSmall: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          titleLarge: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          titleMedium: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          titleSmall: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
          labelLarge: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          labelMedium: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          labelSmall: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0C3C81),
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0C3C81),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      home: const SplashScreen(), // Sementara pakai login langsung
      // Jika ingin pakai logika future, aktifkan kembali FutureBuilder dan initState
      routes: {
        '/login': (context) => const LoginScreen(),
        // '/register': (context) => const RegisterScreen(),
        // '/dashboard': (context) => const DashboardScreen(),
        // '/onboarding': (context) => const OnboardingScreen(),
      },
    );
  }
}
