import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '/BLoC/dashboard/dashboard_bloc.dart';
import '/BLoC/dashboard/dashboard_event.dart';
import '/repository/dashboard_repository.dart';

import '../views/chat/list_chat.dart';
import '/views/matchmaking.dart';
import '/views/profile.dart';
import '/widgets/navigation_widget.dart';
import '/views/splash/splash_screen.dart';
import '/views/onboarding/onboarding_screen.dart';
import '/views/login.dart';
import '/views/register.dart';
import '/views/dashboard.dart';
import '/views/detailpage.dart';
import '/models/worker.dart';

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
      path: '/main/matchmaking',
      builder: (context, state) => const MatchmakingScreen(),
    ),
    ShellRoute(
      navigatorKey: GlobalKey<NavigatorState>(),
      builder: (context, state, child) => NavigationWidget(child: child),
      routes: [
        GoRoute(
          path: '/main/home',
          builder: (context, state) {
            return BlocProvider(
              create: (_) => DashboardBloc(DashboardRepository())..add(LoadWorkers()),
              child: DashboardScreen(),
            );
          },
          routes: [
            GoRoute(
              path: 'worker/:id',
              builder: (context, state) {
                final worker = state.extra as Worker;
                return WorkerProfilePage(worker: worker);
              },
            ),
          ],
        ),
        // GoRoute( 
        //   path: '/main/matchmaking',
        //   builder: (context, state) => const MatchmakingScreen(), //hide navbar ketika di halaman matchmaking
        // ),
        GoRoute(
          path: '/main/chat',
          builder: (context, state) => ChatListPage(),
        ),
        GoRoute(
          path: '/main/profile',
          builder: (context, state) => ProfileScreen(),
        ),
      ],
    ),
  ],
);
