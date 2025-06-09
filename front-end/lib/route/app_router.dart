import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/views/splash/splash_screen.dart';
import '/views/onboarding/onboarding_screen.dart';
import '/views/login.dart';
import '/views/register.dart';
import '/views/dashboard.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      pageBuilder: (context, state) {
        final fromSplash = state.extra == 'fromSplash';

        return fromSplash
            ? CustomTransitionPage(
                key: state.pageKey,
                child: const OnboardingScreen(),
                transitionDuration: const Duration(seconds: 1),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.easeOut;
                  final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  return SlideTransition(position: animation.drive(tween), child: child);
                },
              )
            : MaterialPage(child: const OnboardingScreen());
      },
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) {
        final fromSplash = state.extra == 'fromSplash';

        return fromSplash
            ? CustomTransitionPage(
                key: state.pageKey,
                child: const LoginScreen(),
                transitionDuration: const Duration(seconds: 1),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.easeOut;
                  final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  return SlideTransition(position: animation.drive(tween), child: child);
                },
              )
            : MaterialPage(child: const LoginScreen());
      },
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
  ],
);
