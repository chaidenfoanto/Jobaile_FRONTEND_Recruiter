import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // ⬅️ Tambahkan ini
import 'package:login/login.dart';

import 'views/splash/splash_screen.dart';
import 'views/onboarding/onboarding_screen.dart';
import 'views/login.dart';
// import 'register.dart';
// import 'dashboard_screen.dart';

import 'BLoC/splash/splash_bloc.dart'; // ⬅️ Import SplashBloc kamu
import 'repository/splash_repository.dart'; // ⬅️ Import repository


class Jobaile extends StatefulWidget {
  const Jobaile({super.key});

  @override
  _JobaileAppState createState() => _JobaileAppState();
}

class _JobaileAppState extends State<Jobaile> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider<SplashBloc>(
        create: (context) => SplashBloc(repository: SplashRepository()),
      ),
        // Tambahkan bloc lainnya di sini jika ada
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jobaile',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: const Color(0xFF0C3C81),
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF0C3C81),
            secondary: const Color(0xFF93E0FF),
          ),
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontFamily: 'Poppins', fontSize: 57, fontWeight: FontWeight.bold, color: Colors.black),
            displayMedium: TextStyle(fontFamily: 'Poppins', fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black),
            displaySmall: TextStyle(fontFamily: 'Poppins', fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
            headlineLarge: TextStyle(fontFamily: 'Poppins', fontSize: 32, fontWeight: FontWeight.w700, color: Colors.black),
            headlineMedium: TextStyle(fontFamily: 'Poppins', fontSize: 28, fontWeight: FontWeight.w600, color: Colors.black),
            headlineSmall: TextStyle(fontFamily: 'Poppins', fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
            titleLarge: TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
            titleMedium: TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
            titleSmall: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
            bodyLarge: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
            bodyMedium: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
            bodySmall: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
            labelLarge: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
            labelMedium: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
            labelSmall: TextStyle(fontFamily: 'Poppins', fontSize: 11, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF0C3C81),
            foregroundColor: Colors.white,
            titleTextStyle: TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0C3C81),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w500),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        home: const SplashScreen(),
        routes: {
          '/login': (context) => const LoginScreen(),
          '/onboarding': (context) => const OnboardingScreen(),
          // '/register': (context) => const RegisterScreen(),
          // '/dashboard': (context) => const DashboardScreen(),
        },
      ),
    );
  }
}
